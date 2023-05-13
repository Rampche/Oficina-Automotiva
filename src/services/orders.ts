//import { PrismaClient } from '@prisma/client';
import { PrismaClient } from '@prisma/client';
import { Order } from '../models/order';

export const prisma = new PrismaClient();

//List all service orders
const list = (order_id: string) => {
  prisma.order.findMany({
    where: {
      order_id,
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
const create = (order: Order, car_id: string, user_id: string) =>
  prisma.order.create({
    data: {
      ...order,
      car: {
        connect: { car_id },
      },
      user: {
        connect: { user_id },
      },
    },
    /* include: {
      items: true
    } */
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

export { list, detail, create, update, remove };
