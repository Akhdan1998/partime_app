part of '../pages.dart';

class ReusableExpansionTile<T> extends StatefulWidget {
  final String title;
  final List<T> items;
  final ValueChanged<bool>? onExpansionChanged;

  final Widget Function(T item, bool isSelected) itemBuilder;

  final void Function(T item)? onItemPressed;
  final Color? textColor;
  final Color? borderColor;
  final Color? iconColor;
  final Color? trailingColor;
  final Color? dividerColor;
  final Color? leadingIconColor;
  final Widget? leadingIcon;
  final double? minTileHeight;
  final double? fontSize;
  final Alignment titleAlignment;
  final T? initialSelectedItem;
  final bool closeOnSelect;
  final EdgeInsetsGeometry padding;

  final bool enableSearch;
  final String? searchHint;
  final String Function(T item)? searchKey;

  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final Color Function(T item, bool isSelected)? itemBackgroundBuilder;

  final int? maxVisibleItems;
  final double? itemHeight;

  const ReusableExpansionTile({
    super.key,
    required this.title,
    required this.items,
    required this.onExpansionChanged,
    required this.itemBuilder,
    this.onItemPressed,
    this.textColor,
    this.borderColor,
    this.iconColor,
    this.trailingColor,
    this.dividerColor,
    this.leadingIconColor,
    this.leadingIcon,
    this.minTileHeight,
    this.fontSize,
    this.titleAlignment = Alignment.center,
    this.initialSelectedItem,
    this.closeOnSelect = false,
    this.padding = EdgeInsets.zero,
    this.enableSearch = false,
    this.searchHint,
    this.searchKey,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.itemBackgroundBuilder,
    this.maxVisibleItems,
    this.itemHeight,
  });

  @override
  State<ReusableExpansionTile<T>> createState() =>
      _ReusableExpansionTileState<T>();
}

class _ReusableExpansionTileState<T> extends State<ReusableExpansionTile<T>> {
  T? _selectedItem;
  bool isExpanded = false;
  Key tileKey = UniqueKey();

  TextEditingController? _searchController;
  String _searchQuery = '';

  @override
  void initState() {
    super.initState();
    _selectedItem = widget.initialSelectedItem;

    if (widget.enableSearch) {
      _searchController = TextEditingController();
    }
  }

  @override
  void didUpdateWidget(covariant ReusableExpansionTile<T> oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.initialSelectedItem != oldWidget.initialSelectedItem) {
      _selectedItem = widget.initialSelectedItem;
    }

    if (!oldWidget.enableSearch && widget.enableSearch) {
      _searchController ??= TextEditingController();
    }

    if (oldWidget.enableSearch && !widget.enableSearch) {
      _searchController?.dispose();
      _searchController = null;
      _searchQuery = '';
    }
  }

  @override
  void dispose() {
    _searchController?.dispose();
    super.dispose();
  }

  List<T> get _filteredItems {
    if (!widget.enableSearch || _searchQuery.isEmpty) return widget.items;

    final q = _searchQuery.toLowerCase();
    return widget.items.where((item) {
      final text =
      (widget.searchKey?.call(item) ?? item.toString()).toLowerCase();
      return text.contains(q);
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final filteredItems = _filteredItems;

    return Container(
      padding: widget.padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        border: Border.all(
          color: widget.borderColor ?? white,
          width: 1,
        ),
      ),
      child: ExpansionTile(
        key: tileKey,
        minTileHeight: widget.minTileHeight ?? 48,
        tilePadding: const EdgeInsets.only(left: 20, right: 20),
        title: Align(
          alignment: widget.titleAlignment,
          child: Text(
            widget.title,
            style: TextStyle(
              color: widget.textColor ?? white,
              fontSize: widget.fontSize ?? 15,
            ),
          ),
        ),
        iconColor: widget.iconColor ?? white,
        collapsedIconColor: widget.iconColor ?? (widget.textColor ?? orange),
        onExpansionChanged: (expanded) {
          setState(() => isExpanded = expanded);
          widget.onExpansionChanged?.call(expanded);
        },
        shape: const RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        collapsedShape: RoundedRectangleBorder(
          side: BorderSide.none,
          borderRadius: BorderRadius.circular(30),
        ),
        leading: widget.leadingIcon,
        trailing: Icon(
          isExpanded ? Icons.expand_less : Icons.expand_more,
          color: widget.trailingColor ?? white,
        ),
        children: [
          if (widget.enableSearch) ...[
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 8),
              child: TextFieldCustom(
                hintText: widget.searchHint ?? 'search'.tr,
                controller: _searchController,
                autoFocus: false,
                filled: true,
                fillColor: transparentColor,
                keyboardType: TextInputType.text,
                minLines: 1,
                maxLines: 1,
                borderRadius: 8,
                borderSide: BorderSide(
                  color: widget.dividerColor ?? white,
                  width: 1,
                ),
                enabledBorderSide: BorderSide(
                  color: widget.dividerColor ?? white,
                  width: 1,
                ),
                focusedBorderSide: BorderSide(
                  color: widget.dividerColor ?? white,
                  width: 1.2,
                ),
                errorBorderSide: BorderSide(
                  color: widget.dividerColor ?? white,
                  width: 1,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  vertical: 8,
                  horizontal: 10,
                ),
                prefixIcon: Icon(
                  Icons.search,
                  size: 18,
                  color: (widget.textColor ?? white).withOpacity(0.7),
                ),
                suffixIcon: _searchQuery.isNotEmpty
                    ? IconButton(
                  icon: Icon(
                    Icons.clear,
                    size: 18,
                    color:
                    (widget.textColor ?? white).withOpacity(0.7),
                  ),
                  onPressed: () {
                    _searchController?.clear();
                    setState(() => _searchQuery = '');
                  },
                )
                    : null,
                onChanged: (value) => setState(() => _searchQuery = value),
              ),
            ),
          ],
          if (filteredItems.isNotEmpty) _buildItemsArea(context, filteredItems),
        ],
      ),
    );
  }

  Widget _buildItemsArea(BuildContext context, List<T> items) {
    final int? maxVisible = widget.maxVisibleItems;

    if (maxVisible == null || items.length <= maxVisible) {
      return Column(
        children: List.generate(
            items.length, (i) => _buildItemRow(context, items[i], i)),
      );
    }

    final double rowHeight = widget.itemHeight ?? 44;
    final double boxHeight = rowHeight * maxVisible;

    return SizedBox(
      height: boxHeight,
      child: ListView.builder(
        padding: const EdgeInsets.only(bottom: 8),
        itemCount: items.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: rowHeight,
            child: _buildItemRow(context, items[index], index),
          );
        },
      ),
    );
  }

  Widget _buildItemRow(BuildContext context, T item, int index) {
    final isSelected = _selectedItem == item;

    final Color bgColor =
        widget.itemBackgroundBuilder?.call(item, isSelected) ??
            (isSelected
                ? (widget.selectedItemColor ?? white)
                : (widget.unselectedItemColor ?? transparentColor));

    return Column(
      children: [
        if (index > 0)
          _buildDivider(
            context,
            color: widget.dividerColor ?? white,
            endIndent: 20,
            indent: 20,
            thickness: 1,
          ),
        Material(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              setState(() => _selectedItem = item);
              widget.onItemPressed?.call(item);

              if (widget.closeOnSelect) {
                Future.microtask(() {
                  if (!mounted) return;
                  setState(() {
                    tileKey = UniqueKey();
                    isExpanded = false;
                  });
                });
              }
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4),
              child: widget.itemBuilder(item, isSelected),
            ),
          ),
        ),
      ],
    );
  }
}