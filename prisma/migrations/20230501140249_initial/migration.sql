-- CreateTable
CREATE TABLE `User` (
    `user_id` INTEGER NOT NULL AUTO_INCREMENT,
    `login` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,

    UNIQUE INDEX `User_login_key`(`login`),
    PRIMARY KEY (`user_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Car` (
    `car_id` INTEGER NOT NULL AUTO_INCREMENT,
    `registration` VARCHAR(255) NOT NULL,
    `brand` VARCHAR(255) NOT NULL,
    `model` VARCHAR(255) NOT NULL,
    `color` VARCHAR(255) NOT NULL,
    `observations` VARCHAR(255) NOT NULL,

    UNIQUE INDEX `Car_registration_key`(`registration`),
    PRIMARY KEY (`car_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Order` (
    `order_id` INTEGER NOT NULL AUTO_INCREMENT,
    `order_date` DATETIME(3) NOT NULL,
    `order_time` DATETIME(3) NOT NULL,
    `total` DOUBLE NOT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,
    `carId` INTEGER NOT NULL,

    UNIQUE INDEX `Order_carId_key`(`carId`),
    PRIMARY KEY (`order_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Item` (
    `item_id` INTEGER NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(191) NOT NULL,
    `value` DOUBLE NOT NULL,

    PRIMARY KEY (`item_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Order` ADD CONSTRAINT `Order_carId_fkey` FOREIGN KEY (`carId`) REFERENCES `Car`(`car_id`) ON DELETE RESTRICT ON UPDATE CASCADE;
