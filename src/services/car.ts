import { PrismaClient } from "@prisma/client";

export const prisma = new PrismaClient();


//Create car
const create = (brand: string,
model: string,
color: string) => prisma.product.

//?https://vapor.codes/

//List all Cars
const list = () => prisma.car.findMany({
    where: {
        deleted: false
    }
})

const detail = ()

export {list}