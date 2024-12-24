using {dmart.db as db} from '../db/data-model';

service DmartService {

// Expose Buycollection entity
entity BuyCollection as projection on db.BuyCollection;

// Expose Monthly shoppinglist entity
entity MonthlyShoppingList as projection on db.MonthlyShoppingList;

}
