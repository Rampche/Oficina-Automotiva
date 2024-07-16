/*
  Warnings:

  - You are about to drop the `_cartoorder` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `_itemtoorder` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `order` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropForeignKey
ALTER TABLE `_cartoorder` DROP FOREIGN KEY `_CarToOrder_A_fkey`;

-- DropForeignKey
ALTER TABLE `_cartoorder` DROP FOREIGN KEY `_CarToOrder_B_fkey`;

-- DropForeignKey
ALTER TABLE `_itemtoorder` DROP FOREIGN KEY `_ItemToOrder_A_fkey`;

-- DropForeignKey
ALTER TABLE `_itemtoorder` DROP FOREIGN KEY `_ItemToOrder_B_fkey`;

-- DropForeignKey
ALTER TABLE `order` DROP FOREIGN KEY `Order_userId_fkey`;

-- DropTable
DROP TABLE `_cartoorder`;

-- DropTable
DROP TABLE `_itemtoorder`;

-- DropTable
DROP TABLE `order`;

-- CreateTable
CREATE TABLE `Orders` (
    `order_id` VARCHAR(191) NOT NULL,
    `order_number` VARCHAR(255) NOT NULL,
    `order_date_time` TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP(3),
    `total` FLOAT NULL,
    `deleted` BOOLEAN NOT NULL DEFAULT false,
    `userId` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `Orders_order_number_key`(`order_number`),
    PRIMARY KEY (`order_id`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_CarToOrders` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_CarToOrders_AB_unique`(`A`, `B`),
    INDEX `_CarToOrders_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `_ItemToOrders` (
    `A` VARCHAR(191) NOT NULL,
    `B` VARCHAR(191) NOT NULL,

    UNIQUE INDEX `_ItemToOrders_AB_unique`(`A`, `B`),
    INDEX `_ItemToOrders_B_index`(`B`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Orders` ADD CONSTRAINT `Orders_userId_fkey` FOREIGN KEY (`userId`) REFERENCES `User`(`user_id`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CarToOrders` ADD CONSTRAINT `_CarToOrders_A_fkey` FOREIGN KEY (`A`) REFERENCES `Car`(`car_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_CarToOrders` ADD CONSTRAINT `_CarToOrders_B_fkey` FOREIGN KEY (`B`) REFERENCES `Orders`(`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ItemToOrders` ADD CONSTRAINT `_ItemToOrders_A_fkey` FOREIGN KEY (`A`) REFERENCES `Item`(`item_id`) ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `_ItemToOrders` ADD CONSTRAINT `_ItemToOrders_B_fkey` FOREIGN KEY (`B`) REFERENCES `Orders`(`order_id`) ON DELETE CASCADE ON UPDATE CASCADE;
