from neo4j import GraphDatabase

# Configurações de conexão
uri = "bolt://localhost:7687"  # Substitua pelo URI do seu servidor Neo4j
username = "neo4j"
password = "lab44123"

def execute_query(query):
        with GraphDatabase.driver(uri, auth=("neo4j", password)) as driver:
            with driver.session() as session:
                result = session.run(query)
                print(query)
                print()
                return (result.data())
                # return (result.data())


def import_csv_data(csv_file_path):
    with GraphDatabase.driver(uri, auth=("neo4j", password)) as driver:
        with driver.session() as session:
            session.run("""
                LOAD CSV WITH HEADERS FROM $csvFile AS row

                // Create or merge Book node
                MERGE (b:Book {isbn13: row.isbn13})
                SET b.isbn10 = row.isbn10,
                    b.title = row.title,
                    b.subtitle = row.subtitle,
                    b.thumbnail = row.thumbnail,
                    b.description = row.description,
                    b.published_year = toInteger(row.published_year),
                    b.average_rating = toFloat(row.average_rating),
                    b.num_pages = toInteger(row.num_pages),
                    b.ratings_count = toInteger(row.ratings_count)

                // Split authors and create or merge Author node(s)
                WITH row, b, split(row.authors, ',') AS authorNames
                UNWIND authorNames AS authorName
                MERGE (a:Author {name: trim(authorName)})

                // Create relationship between Book and Author
                MERGE (b)-[:Write_by]->(a)

                // Split categories and create or merge Category node(s)
                WITH row, b, split(row.categories, ',') AS categoryNames
                UNWIND categoryNames AS categoryName
                MERGE (cat:Category {name: trim(categoryName)})

                // Create relationship between Book and Category
                MERGE (b)-[:Has_Category]->(cat)
            """, csvFile=csv_file_path)
    print("Data Uploaded Sucessfully")
    print()

def write_in_document(f,query,enunciado):
    f.write(enunciado)
    f.write("\n")
    f.write("\n")
    f.write(query)
    f.write("\n")
    f.write("\n")
    f.write(str(execute_query(query)))
    f.write("\n")
    f.write("\n")



# # Caminho do arquivo CSV
csv_file_path = "file:///data.csv"  # Substitua pelo caminho do seu arquivo CSV

# # Importar dados do CSV
import_csv_data(csv_file_path)

with open("CBD_L44c_output.txt","w") as f: 
    
    write_in_document(f,"MATCH (b:Book)-[:Has_Category]->(c:Category {name: 'Drama'}) RETURN b.title as name"
                      ,"1 Ver todos os livros com a categoria \"Drama\"")

    write_in_document(f,"MATCH (a:Author)<-[:Write_by]-(b:Book) RETURN a.name , COUNT(b) AS numero_livros ORDER BY numero_livros DESC;"
                      ,"2 Numero de livros que cada autor escreveu")

    write_in_document(f,"MATCH (b:Book) WHERE b.published_year >= 2013 AND b.published_year <= 2015 RETURN b.title,b.published_year;"
                      ,"3 Livros publicados entre 2013 e 2015")

    write_in_document(f,"MATCH (b:Book)-[:Write_by]->(a:Author) WHERE toLower(b.title) CONTAINS 'harry potter' RETURN b.title AS bookTitle, a.name AS authorName;"
                      ,"4 Todos os livros sobre Harry Potter e respetivos autores")

    write_in_document(f,"MATCH (c:Category)<-[:Has_Category]-(b:Book) RETURN c.name AS category, COUNT(b) AS numberOfBooks ORDER BY numberOfBooks DESC;"
                      ,"5 Numero de livros em cada categoria")

    write_in_document(f,"MATCH (b:Book) WHERE b.average_rating IS NOT NULL RETURN b.title, b.average_rating ORDER BY b.average_rating DESC LIMIT 15;"
                      ,"6 Top 15 livros de acordo com o rating")

    write_in_document(f,"MATCH (c:Category)<-[:Has_Category]-(b:Book) WHERE b.num_pages > 2000 RETURN c.name AS category, COUNT(b) AS numberOfBooks ORDER BY numberOfBooks DESC;"
                      ,"7 Numero de livros de cada categoria que têm mais de 2000 paginas ordenados por ordem descrescente")

    write_in_document(f,"MATCH (a:Author)<-[:Write_by]-(b:Book)-[:Has_Category]->(c:Category {name: 'Fiction'}) RETURN a.name,b.title,c.name"
                      ,"8 Mostrar os livros de cada autor que sao de 'Fiction'")

    write_in_document(f,"MATCH path = shortestPath((c1:Category {name: 'Drama'})-[*]-(c2:Category {name: 'Fiction'})) RETURN nodes(path) AS categoryNodes, relationships(path) AS categoryRelationships;"
                      ,"9 Caminho mais curto entre \"Drama\" e \"Fiction\"")

    write_in_document(f,"MATCH (n:Book)-[:Has_Category]->(cat:Category{name:'Fiction'}) where n.ratings_count>500000 and n.average_rating < 3.8 return n.title, n.average_rating,n.isbn10 Order by n.isbn10 asc"
                      ,"10 Todos os livros da categoria \"Fiction\" com mais de 500000 ratings e com rating menor que 3.8 ordenados por ordem crescente de ISBN10")

