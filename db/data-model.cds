namespace dmart.db;
using { cuid } from '@sap/cds/common';


entity BuyCollection {
    key ID : Int16;
        item : String(40);
        itemInTelugu : localized String(40);
        UoM : UnitOfMeasure;
        category : Category;
}


entity MonthlyShoppingList : cuid {
    key ID           : UUID;
    month            : Date default $now;                      // Month for the list
    item             : Association to BuyCollection; // Link to master list
    plannedQuantity  : Int16 @assert.range: [0, 100];
    status           : ShoppingStatus default 'Planned';           // Planned, Taken, NotAvailable
}

type ShoppingStatus: String enum {
    Planned;
    InProgress;
    Taken;
    NotAvailable;
    Skipped;
}

type UnitOfMeasure : String enum {
  KG;
    Litre;
    Packs;
    Pieces;
    Dozens;
}

type Category : String enum {
    Grocery;
    Flour;
    PersonalCare;
    HouseHold;
    Cosmetics;
    Beverages;
    Snacks;
    Frozen;
}

