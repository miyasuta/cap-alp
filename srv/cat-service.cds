using my.bookshop as my from '../db/data-model';

service CatalogService {
    @readonly entity BooksAnalytics as projection on my.Books;
}