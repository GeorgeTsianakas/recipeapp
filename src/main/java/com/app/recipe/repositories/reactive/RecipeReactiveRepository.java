package com.app.recipe.repositories.reactive;

import com.app.recipe.domain.Recipe;
import org.springframework.data.mongodb.repository.ReactiveMongoRepository;

public interface RecipeReactiveRepository extends ReactiveMongoRepository<Recipe, String>{
}
