import { Request, Response } from 'express';
import { update, detail } from '../../services/orders';

export default async (req: Request, res: Response) => {
  const { id } = req.params;
  const { car, user } = req.body;

  if (!(await detail(id))) {
    return res.status(404).json({
      code: 404,
      message: 'Order not found',
    });
  }

  const order = await update(id, car, user);
  return res.json(order);
};
