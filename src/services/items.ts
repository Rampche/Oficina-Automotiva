import { PrismaClient } from '@prisma/client';
import { Item } from '../models/Item';

export const prisma = new PrismaClient();

//Create a new Item
const create = (item: Item) =>
  prisma.item.create({
    data: {
      ...item,
    },
  });

//Update the Item
const update = (id: string, item: Item) =>
  prisma.item.update({
    where: { item_id: id },
    data: { ...item },
  });

//Delete the Item
const remove = (id: string) =>
  prisma.item.update({
    where: {
      item_id: id,
    },
    data: {
      deleted: true,
    },
  });

//List all Items
const list = () =>
  prisma.item.findMany({
    where: {
      deleted: false,
    },
  });

//Detail a Item
const detail = (item_id: string) =>
  prisma.item.findFirst({
    where: {
      item_id,
      deleted: false,
    },
  });

export { create, detail, update, remove, list };
