import { PrismaClient, Order } from '@prisma/client';
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
const add = async (userId: string, itemsId: string[], carId: string) => {
  //First, it is necessary to find items value:
  const items = await prisma.item.findMany({
    where: {
      item_id: {
        in: itemsId,
      },
    },
  });

  //Them calculate the total amount:
  const total = items.reduce((acc: number, item: Item) => acc + item.value, 0);

  return prisma.order.create({
    data: {
      user: {
        connect: {
          user_id: userId,
        },
      },
      items: {
        connect: itemsId.map((itemId) => ({
          item_id: itemId,
        })),
      },
      car: {
        connect: { car_id: carId },
      },
      order_date: new Date(),
      order_time: new Date().toLocaleTimeString(),
      total: total,
    },
    include: {
      car: true,
    },
  });
};

export { list, detail, add };
