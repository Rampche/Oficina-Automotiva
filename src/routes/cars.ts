import express from 'express';
import { create, list, read, remove, update } from '../actions/cars';

const router = express.Router();

router.get('', list);
router.get('/:id', read);
router.post('', create);
router.delete('/:id', remove);
router.put('/:id', update);

export default router;
