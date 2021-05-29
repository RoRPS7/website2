# README
Projekt na rozwiązania szkieletowe w tworzeniu aplikacji <br>
"Przewodnik po mieście"<br/>
<p>Aplikacja powinna posiadac baze atrakcji dostepnych dla turystów w danym miescie. Kazda atrakcja przypisana jest do okreslonej kategorii (np. muzeum, pomnik, obiekt sakralny, itp.), posiada swoje połozenie, czas potrzebny na jej zwiedzanie, ewentualna cene biletu wstepu, opis i inne parametry. Turysta planujacy odwiedzic miasto moze zaplanowac indywidualna trase zwiedzania wkładajac do koszyka atrakcje, które chciałby zobaczyc. Aplikacja powinna wygenerowac optymalny plan zwiedzania w postaci listy z opisami i mapy z zaznaczonymi atrakcjami. Nalezy uwzglednic czas potrzebny na przemieszczanie sie pomiedzy atrakcjami.
problemy do rozwazenia: kryteria optymalnosci planu, zapamietywanie planów, gotowe propozycje planów, pobieranie planów w formacie pdf </p>

* Ruby version 2.7.2

* Configuration bundle install

* Database creation rails db:schema:load

* Database initialization rails db:seed

* Deployment instructions

W celu uruchomienia aplikacji należy:
<ol>
<li> wpisać komendę "bundle install"</li>
<li> zakomentować w pliku "routes.rb" od 3 do 5 linijki </li>
<li> załadować bazę z schema.rb komendą "db:schema:load"</li>
<li> załadować początkowe dane do tabel za pomocą "db:seed"</li>
<li> uruchomić serwer za pomocą "rails s"</li>
<li>UWAGA DO TESTOWANIA! w celu zalogowania się do panelu administracyjnego nalezy użyć danych do logowania : email: "administrator@admin.pl", hasło: "administrator123"</li>
</ol>
* ...
