-- Catálogo de IDs recebidos do criador. Metadados de referência, NÃO resultados de teste.
-- Importar onde fizer sentido; verificar rig R6 e permissão de uso em cada experiência.
local Catalog = {
    CoffeeHold = {
        Id = "rbxassetid://135391868063277", Loop = true,
        Purpose = "Pegar e segurar uma xícara", DurationHint = nil,
    },
    CoffeeDrink = {
        Id = "rbxassetid://115563592156206", Loop = false,
        Purpose = "Beber café", DurationHint = 1.1, SipMomentHint = 0.77,
    },
    BookGeneric = {
        Id = "rbxassetid://137835407978976", Loop = nil,
        Purpose = "Leitura genérica, referência anterior", DurationHint = nil,
    },
    BookHold = {
        Id = "rbxassetid://108890928738618", Loop = true,
        Purpose = "Segurar livro na mão direita", DurationHint = nil,
    },
    BookTurnPage = {
        Id = "rbxassetid://95432586788785", Loop = false,
        Purpose = "Virar página", DurationHint = 1.3,
    },
}
return table.freeze(Catalog)
