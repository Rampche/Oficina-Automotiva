/*
  Warnings:

  - You are about to drop the column `order_date` on the `order` table. All the data in the column will be lost.
  - You are about to drop the column `order_time` on the `order` table. All the data in the column will be lost.
  - Added the required column `order_date_time` to the `Order` table without a default value. This is not possible if the table is not empty.
  - Added the required column `name` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- AlterTable
ALTER TABLE `item` ADD COLUMN `deleted` BOOLEAN NOT NULL DEFAULT false;

-- AlterTable
ALTER TABLE `order` DROP COLUMN `order_date`,
    DROP COLUMN `order_time`,
    ADD COLUMN `order_date_time` TIMESTAMP(3) NOT NULL;

-- AlterTable
ALTER TABLE `user` ADD COLUMN `name` VARCHAR(255) NOT NULL;
