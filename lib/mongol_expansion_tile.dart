import 'package:flutter/material.dart';

enum ExpandDirection {
  left,
  right,
  up,
  down,
}

/// Mongol text adapted expansion/collapse widget
/// 
/// Supports expansion animations in four directions, adapted for Mongol vertical layout
class MongolExpansionTile extends StatefulWidget {
  final Widget title;
  final List<Widget> children;

  /// Expansion direction
  final ExpandDirection direction;

  /// Uncontrolled mode
  final bool initiallyExpanded;

  /// Controlled mode (passed from outside)
  final bool? expanded;
  final ValueChanged<bool>? onChanged;

  /// Animation
  final Duration duration;
  final Curve curve;
  final bool enableAnimation;

  /// Styling
  final EdgeInsetsGeometry titlePadding;
  final EdgeInsetsGeometry childrenPadding;
  final Color? backgroundColor;
  final Widget? trailing;

  /// Interaction
  final bool tapToToggle;

  /// Whether to use ListView to display children
  final bool useListView;

  /// ListView scroll direction (only effective when useListView is true)
  final Axis scrollDirection;

  /// ListView scroll controller (optional)
  final ScrollController? scrollController;

  /// ListView scroll physics (optional)
  final ScrollPhysics? physics;

  const MongolExpansionTile({
    super.key,
    required this.title,
    required this.children,
    this.direction = ExpandDirection.left,
    this.initiallyExpanded = false,
    this.expanded,
    this.onChanged,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.enableAnimation = true,
    this.tapToToggle = true,
    this.titlePadding = const EdgeInsets.all(8),
    this.childrenPadding = const EdgeInsets.all(8),
    this.backgroundColor,
    this.trailing,
    this.useListView = false,
    this.scrollDirection = Axis.horizontal,
    this.scrollController,
    this.physics,
  });

  @override
  State<MongolExpansionTile> createState() => _MongolExpansionTileState();
}

class _MongolExpansionTileState extends State<MongolExpansionTile>
    with SingleTickerProviderStateMixin {
  late bool _internalExpanded;
  late AnimationController _controller;
  late Animation<double> _animation;

  bool get _isExpanded => widget.expanded ?? _internalExpanded;

  Axis get _axis =>
      (widget.direction == ExpandDirection.left ||
              widget.direction == ExpandDirection.right)
          ? Axis.horizontal
          : Axis.vertical;

  double get _axisAlignment {
    switch (widget.direction) {
      case ExpandDirection.left:
      case ExpandDirection.up:
        return -1.0;
      case ExpandDirection.right:
      case ExpandDirection.down:
        return 1.0;
    }
  }

  @override
  void initState() {
    super.initState();

    _internalExpanded = widget.initiallyExpanded;

    _controller = AnimationController(
      vsync: this,
      duration: widget.duration,
      value: _isExpanded ? 1.0 : 0.0,
    );

    _animation = CurvedAnimation(
      parent: _controller,
      curve: widget.curve,
    );
  }

  @override
  void didUpdateWidget(covariant MongolExpansionTile oldWidget) {
    super.didUpdateWidget(oldWidget);

    // Update animation controller duration and curve if changed
    if (widget.duration != oldWidget.duration) {
      _controller.duration = widget.duration;
    }
    if (widget.curve != oldWidget.curve) {
      _animation = CurvedAnimation(
        parent: _controller,
        curve: widget.curve,
      );
    }

    // Update animation state if expanded state changed
    if (widget.expanded != null &&
        widget.expanded != oldWidget.expanded) {
      final isExpanded = widget.expanded!;
      if (widget.enableAnimation) {
        isExpanded ? _controller.forward() : _controller.reverse();
      } else {
        _controller.value = isExpanded ? 1.0 : 0.0;
      }
    }
  }

  void _toggle() {
    final next = !_isExpanded;

    if (widget.expanded == null) {
      setState(() => _internalExpanded = next);
    }

    widget.onChanged?.call(next);

    if (widget.enableAnimation) {
      next ? _controller.forward() : _controller.reverse();
    } else {
      // Sync controller value when animation is disabled
      _controller.value = next ? 1.0 : 0.0;
    }
  }

  Widget _buildChildren() {
    Widget content;

    if (widget.useListView) {
      content = Padding(
        padding: widget.childrenPadding,
        child: ListView(
          scrollDirection: widget.scrollDirection,
          controller: widget.scrollController,
          physics: widget.physics,
          shrinkWrap: true,
          children: widget.children,
        ),
      );
    } else {
      content = Padding(
        padding: widget.childrenPadding,
        child: _axis == Axis.horizontal
            ? Row(children: widget.children)
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: widget.children,
              ),
      );
    }

    if (!widget.enableAnimation) {
      return _isExpanded ? content : const SizedBox.shrink();
    }

    return SizeTransition(
      sizeFactor: _animation,
      axis: _axis,
      axisAlignment: _axisAlignment,
      child: content,
    );
  }

  Widget _buildHeader() {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: widget.tapToToggle ? _toggle : null,
      child: Container(
        padding: widget.titlePadding,
        color: widget.backgroundColor,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            widget.title,
            if (widget.trailing != null) widget.trailing as Widget,
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final header = _buildHeader();
    final children = _buildChildren();

    if (_axis == Axis.vertical) {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          header,
          children,
        ],
      );
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: widget.direction == ExpandDirection.left
          ? [children, header]
          : [header, children],
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

