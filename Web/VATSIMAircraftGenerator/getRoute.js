function getRoute(from, to) {
    for (var item: routes) {
        if (item[0] == from && item[2] == to) {
            return item;
        }
    }
    return null;
}
