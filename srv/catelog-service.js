const cds = require('@sap/cds');

module.exports = cds.service.impl(async function () {
    const { MonthlyShoppingList } = this.entities;

    this.before("CREATE", "MonthlyShoppingList", async (req) => {
        const { plannedQuantity, status } = req.data;

        // Validation: Planned items cannot have quantity as zero
        if (status === "Planned" && plannedQuantity === 0) {
            req.error(400, "Planned items cannot have a quantity of zero.");
        }
    });

    this.before("UPDATE", "MonthlyShoppingList", async (req) => {
        const { plannedQuantity, status } = req.data;

        // Validation: Planned items cannot have quantity as zero
        if (status === "Planned" && plannedQuantity === 0) {
            req.error(400, "Planned items cannot have a quantity of zero.");
        }
    });
});
