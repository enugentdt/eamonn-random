function getRoute(from, to) {
    for (var i = 0; i < routes.length; i++) {
        var item = routes[i];
        if (item[0] == from && item[2] == to) {
            return item;
        }
    }
    return null;
}
