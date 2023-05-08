import { PrismaClient, Order } from '@prisma/client';

export const prisma = new PrismaClient();

//List all service orders
const list = () => {
  //! pass (userId: string) as func params
  prisma.order.findMany({
    where: {
      //userId,
      deleted: false,
    },
    include: {
      car: true,
    },
  });
};

export { list };
