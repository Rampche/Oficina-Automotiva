import express from 'express';
import { create } from '../actions/orders';

const router = express.Router();

router.post('', create);
/* router.get('', list);
router.get('/:id', read);
router.delete('/:id', remove);
router.put('/:id', update); */

export default router;
