use store;

db.createUser({
    user: "shop_manager",
    pwd: "shop_manager",
    roles: [{ role: "dbOwner", db: "store" }] // 'dbOwner' gives full permissions
});

db.createUser({
    user: "shop_api",
    pwd: "shop_api",
    roles: [{ role: "readWrite", db: "store" }] // 'readWrite' allows SELECT and MODIFY
});