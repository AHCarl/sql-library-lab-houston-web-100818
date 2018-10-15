def select_books_titles_and_years_in_first_series_order_by_year
  "SELECT title, year FROM books WHERE series_id = (SELECT MIN(series_id) FROM books) ORDER BY year"
end

def select_name_and_motto_of_char_with_longest_motto
  "SELECT name, motto FROM characters WHERE LENGTH(motto) = (SELECT MAX(LENGTH(motto)) from characters)"
end


def select_value_and_count_of_most_prolific_species
  "SELECT species, COUNT(species) FROM characters GROUP BY species ORDER BY COUNT(species) DESC LIMIT 1"
end

def select_name_and_series_subgenres_of_authors
  "SELECT authors.name, subgenres.name FROM authors, subgenres JOIN series ON authors.id = series.author_id WHERE subgenres.id = series.subgenre_id"
end

def select_series_title_with_most_human_characters
  "SELECT title FROM (
    SELECT series.title AS title, COUNT(characters.series_id) AS num_species FROM series JOIN characters ON series.id = characters.series_id WHERE characters.species = 'human' GROUP BY characters.series_id ORDER BY num_species DESC LIMIT 1)"
end

def select_character_names_and_number_of_books_they_are_in
  "SELECT characters.name, COUNT(character_books.book_id) AS num_books FROM characters JOIN character_books ON characters.id = character_books.character_id GROUP BY characters.name ORDER BY num_books DESC"
end
