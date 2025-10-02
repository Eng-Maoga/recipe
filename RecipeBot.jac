"""Recipe Bot using Gemini API"""

import from byllm.llm { Model }
import os;

# Attach Gemini model
glob llm = Model(
    model_name="gemini/gemini-2.0-flash",
    api_key=os.getenv("GEMINI_API_KEY"),
    verbose=False
);

"""Ask AI for a recipe given ingredients"""
def suggest_recipe(ingredients: str) -> str by llm();

walker RecipeBot {
    can start with entry {
        let ingredients = input("Enter the ingredients you have (comma-separated): ");

        print("\nFinding the best recipe for you... \n");
        let recipe = suggest_recipe(ingredients);

        print("Here’s a recipe you can try: \n");
        print(recipe);
    }
}

with entry: __main__ {
    root spawn RecipeBot();
}
