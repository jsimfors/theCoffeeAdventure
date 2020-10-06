# The Coffee Adventure
Live demo: [bit.ly/coffeedataphp](http://bit.ly/coffeedataphp)

## Introduktion
På vår XML-baserade hemsida The Big Coffee Adventure finns information om alla koppar kaffe på campus! 
Ett projekt gjort i hopp om att alla kaffetörstande studenter och anställda på KTH ska kunna minimera risken att få
en dålig kopp kaffe i handen.

## Hur fungerar sidan?
### Startsida
Startsidan displayar alla olika kaffeställen som finns i databasen, inklusive priset på enliten kaffe, samt det genomsnittliga betyget, beräknat på alla röster som kommit in.
Betyget är visualiserat i hur många av de fem kaffekopparna som är fyllda med kaffe. Du
kan även klicka in på knappen “Coffeesearch”, som leder en till en söksida. Hemsidan är
byggd med hjälp av Bootstrap, och fungerar även finfint att öppna upp på mobilen. När
man är kaffesugen on-the-go.

![Image of startpage](https://i.imgur.com/Y5rMSi4.png)

### Söksida.
Klickar du in på den spännande knappen “Coffeesearch” så kommer du till en söksida.
Där kan du antingen söka på specifika caféer, eller deras plats. Perfekt för den
förvirrade studenten! Sidan behöver inte uppdateras, utan sökningen startas så fort du
lagt dina kaffetörstande labbar på tangentbordet och klickat i den första bokstaven.

![Image of searchpage](https://i.imgur.com/xiPEU8z.png)

### Logga in. ​ Du kan även logga in på sidan. Det gör du i
formuläret längst ner på startsidan. Det är Moe, Joe och Boe som har konton. 

### Cafésidorna.
Håll i hatten nu! Du kan självklart även klicka in på
de olika sidorna. Det gör du på startsidan genom att
klicka på namnet. Då kommer du till en ny sida med mer detaljerad info om det valda cafét.
Här finns information om pris, plats, erbjudanden, kaffekort samt det genomsnittliga betyget med en decimal,
antal röster samt en trevlig liten slideshow av olika bilder på kaffe.

### Caféts röster
Om du scrollar ner inne på sidan för ett café kan
du se alla röster som kommit in. Här kan vi se att
det verkar som om Boe har haft en dålig
kaffeupplevelse på Stories :/

### Formulär för röstning.
Detta formuläret syns endast om
du är inloggad. När du klickar på “GRADE”
sparas betyget i databasen - utan att du behöver
uppdatera sidan. The future is now. 

![Image of voting](https://i.imgur.com/5rVgTo1.png)


### Databas
Vi använder oss av PHP MyAdmin där vi har tre olika
relationer i vår databas. CoffeePlace, Grade och Users. I
CoffeePlace finns information om varje café i varsin tuple.
Med attribut som placeName, price, location, offer och
coffeeCard. Grade innehåller alla betyg sparade som varsin
tuple. Och users alla användare, med namn och lösenord som attribut.
