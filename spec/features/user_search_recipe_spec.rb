require 'rails_helper'

feature 'User search recipe' do
    
    scenario 'Recipe succesfully found' do
        
        cuisine = Cuisine.create(name: 'Brasileira')
        recipe_type = RecipeType.create(name: 'Sobremesa')
        recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type:  recipe_type,
                                cuisine: cuisine, difficulty: 'Médio',
                                cook_time: 60,
                                ingredients: 'Farinha, açucar, cenoura',
                                cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
        
        visit root_path
        fill_in 'Busca', with: 'Bolo de cenoura'
        click_on 'Buscar'
        
        expect(page).to have_css('h1', text: 'Receita encontrada!')
        expect(page).to have_css('h1', text: 'Bolo de cenoura')
        expect(page).to have_css('p', text: 'Sobremesa')
        expect(page).to have_css('p', text: 'Brasileira')
        expect(page).to have_css('p', text: 'Médio')
        expect(page).to have_css('p', text: '60 minutos')
        expect(page).to have_css('p', text: 'Farinha, açucar, cenoura')
        expect(page).to have_css('p', text: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
     
    end
    
    scenario 'Recipe not found' do

        cuisine = Cuisine.create(name: 'Brasileira')
        recipe_type = RecipeType.create(name: 'Sobremesa')
        recipe = Recipe.create(title: 'Bolo de cenoura', recipe_type:  recipe_type,
                                cuisine: cuisine, difficulty: 'Médio',
                                cook_time: 60,
                                ingredients: 'Farinha, açucar, cenoura',
                                cook_method: 'Cozinhe a cenoura, corte em pedaços pequenos, misture com o restante dos ingredientes')
        
        visit root_path
        fill_in 'Busca', with: 'Biscoito'
        click_on 'Buscar'
        
        expect(page).to have_css('h1', text: 'Receita não encontrada!')

    end

end