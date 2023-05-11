//import { PrismaClient } from '@prisma/client';
import { PrismaClient } from '@prisma/client';
import { Item } from '../models/types';

export const prisma = new PrismaClient();

//List all service orders
const list = (userId: string) => {
  prisma.order.findMany({
    where: {
      userId,
      deleted: false,
    },
    include: {
      car: true,
    },
  });
};

//Detail the orders
const detail = (order_id: string) => {
  prisma.order.findFirst({
    where: {
      order_id,
      deleted: false,
    },
    include: {
      car: true,
    },
  });
};

//Add new orders
const add = (car: string, items: string[]) =>
  prisma.order.create({
    data: {
      car,
      items,
      order_date,
      order_time,
      total,
      deleted,
    },
  });

//Update orders
const update = (order_id: string, itemIds: string[]) =>
  prisma.order.update({
    where: {
      order_id,
    },
    data: {
      items: {
        connect: itemIds.map((itemId) => ({ item_id: itemId })),
      },
    },
  });

//Remove orders
const remove = (order_id: string) => {
  prisma.order.update({
    where: { order_id },
    data: {
      deleted: true,
    },
  });
};

export { list, detail, add, update, remove };
