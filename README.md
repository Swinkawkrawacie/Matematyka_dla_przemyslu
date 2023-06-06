# Smog jest zły
### Projekt z przedmiotu Matematyka dla przemysłu, szósty semestr matematyki stosowanej na Politechnice Wrocławskiej (2022/2023)

### Skład grupy:
* Paulina Iwach
* Małgorzata Kowalczyk
* Kamil Kowalski
* Julia Mazur
* Ewa Trębacz

## Przebieg:
W trakcie realizacji projektu próbowano pokazać, że smog jest faktycznym zagrożeniem współczesnego świata. W trakcie zajęć przedstawiono siedem prezentacji mających na celu lepsze zrozumienie problemu. 
* **![Prezentacja 1.](presentations/p1.pdf)** - 08.03.2023r.
  Opierała się na wstępnym przedstawieniu tematu oraz planów z nim związanych. 
* **![Prezentacja 2.](presentations/p2.pdf)** - 15.03.2023r.
  W tej częsci zajęto się stworzeniem bazy danych łączącej potrzebne dane o stężeniach zanieczyszczeń PM $10$ i PM $2.5$ w latach $2015-2019.$ Zebrane informacje dotyczyły kilku polskich miast:  Gdańska, Łodzi, Nowej Rudy, Krakowa, Warszawy i Wrocławia. Wyznaczono podstawowe statystyki oraz częstości przekroczenia norm.
 
BAZA DANYCH             |  PRZEKROCZENIA           
:-------------------------:|:-------------------------:
![Przykładowy fragment bazy danych](/images/p2_data.jpg) | ![Częstości przekroczenia norm zanieczyszczeń dla PM 10](/images/p2_freq.jpg)

Przedstawiono dane na wykresach. Osobno dla kązdego z miast porównano średnie i ekstremalne wartości stężeń dla całego okresu, jak również ze względu na miesiąc. Zauważono, że zanieczyszczenie zwiększa się w miesiącach zimowych, a spada latem. Zwrócono również uwagę na skrajne wartości otrzymane dla większości miast w roku $2017.$
* **![Prezentacja 3.](presentations/p3.pdf)** - 29.03.2023r.
 Powiększono zbiór danych o lata związane z pandemią $(2020-2021).$ Dodatkowo zebrano informacje dotyczące pogody i umieszczono je na wykresach razem ze stężeniami PM $10$ w celu znalezienia potencjalnych zależności. 
 
![Stężenie PM 10 i temperatura w zależności od czasu](/images/p3_PM10_temp.jpg)

 Przeprowadzono także analizę godzinową zanieczyszczeń dla średnich z danej godziny w zależności od pór roku, a także z rozróżnieniem na dni robocze i weekendy.

ZIMA                       |  LATO           
:-------------------------:|:-------------------------:
![Analiza godzina dla danych zimowych](/images/p3_h_winter.jpg) | ![Analiza godzina dla danych letnich](/images/p3_h_summer.jpg)

Zauważono znaczne róznice między zanieczyszczeniami zimą i latem. Zwrócono również uwagę na wzrost wartości stężeń około godziny $10:00$ a także po $18:00.$ Nie stwierdzono znaczących różnic wynikających z podziału na dni robocze i weekendy.

* **![Prezentacja 4.](presentations/p4.pdf)** - 12.04.2023r.
  W tej częsci zawarto dopasowanie modelu ARMA do danych z uwzględnieniem heteroskedastyczności danych poprzez zastosowanie modelu GARCH(1,1). Następnie dokonano predykcji danych na zbiór testowy (ostatnie dwa miesiące roku $2019$) oraz na lata $2020-2021$ (wszystkie zebrane dotychczas dane).
  
Predykcja na dane testowe z usuniętymi trendami i sezonowością                       |  Predykcja na wszystkie surowe dane        
:-------------------------:|:-------------------------:
![Dane testowe](/time_series/plots/predict_lines.jpg) | ![Wszystkie dane](/time_series/plots/back_plot.jpg)

Zauważono, że predykcja na lata związane z pandemią jest sensowna jednak wydaje się przesunieta w czasie, jeśli chodzi o występowanie wartości maksymalnych.

![Kod](time_series/)

W kolejnym kroku zajęto sie rozwinięciem zawartej w poprzedniej części analizy wpływu czynników pogodowych na stężenie zanieczyszczeń. Największe (co do modułu) korelacje zaobserwowano dla prędkości wiatru i temperatury. Ma to związek z faktem, że przy silnym wietrze zanieczyszczenia będą się bardziej rozprzestrzeniać i tym samym ograniczone zostanie tworzenie się skupisk o odnotowanych dużych wartościach stężeń.

Stężenie w zależności od prędkości wiatru    |  Stężenie w zależności od temperatury       
:-------------------------:|:-------------------------:
![Prędkość wiatru](/images/p4_speed.jpg) | ![Wszystkie dane](/images/p4_temp.jpg)

Na zakończenie przedstawiono dalszy plan działania, prezentując podstawowe idee machine learningu i ich możliwe wykorzystanie.
* **![Prezentacja 5.](presentations/p5.pdf)** - 10.05.2023r.
  Przedstawiono Gaussian Plume Model, opisujący rozprzestrzenianie się zanieczyszczeń z punktowego źródła emitującego zanieczyszczenie przez godzinę. Przeanalizowano jak model uwzględnia wpływ czynników pogodowych oraz jego zachowanie przy zmianie odległości od źródła. Wygenerowano przykładowy model w 3D dla pokazania charakterystycznego kształu.
  
Widok na przeciwko źródła   |  Widok z boku źródła       
:-------------------------:|:-------------------------:
![Widok yz](/gaussiann_plume_model/model_plots/3D_plots_model_only/surface9_1.jpg) | ![Widok xz](/gaussiann_plume_model/model_plots/3D_plots_model_only/surface9_2.jpg)

Następnie podjęto próbę zaprezentowania uproszczonego zachowania modelu w czasie z uwzględnieniem kierunku wiatru.

Po dniu   |  Po tygodniu    
:-------------------------:|:-------------------------:
![24h](/gaussiann_plume_model/model_plots/2D_time_changes/week/day1_plot.jpg) | ![Tydzień](/gaussiann_plume_model/model_plots/2D_time_changes/week/day7_plot.jpg)

Linie na wykresie są wynikiem błędu popełnianego w przybliżaniu wartości współrzędnych podczas obracania wyników zgodnie z kierunkiem wiatru. Nie przeszkadzają one jednak w dostrzeżeniu tworzących się w czasie kształtów. Przesunięcie maksymalnych wartości stężeń z punktu, w którym znajduje się źródło wynika z tego, że analizowano wyniki na wysokości $z$ poniżej źródła.

![Kod](gaussiann_plume_model/)

* **![Prezentacja 6.](presentations/p6.pdf)** - 24.05.2023r.
Przedstwiono możliwość modelowania i predykowania zanieczyszczenia powietrza z wykorzystaniem machine learningu na pryzkładzie modeli Ranodm Forest i OLS.
![OLS](/machine_learning/warszawa_ols.png) | ![RandomForest](/machine_learning/random_forest.png)

* **![Prezentacja 7.](presentations/p7.pdf)** - 07.06.2023r.
  Podsumowanie.
 
## Dane:
1. ![Dane dotyczące zanieczyszczeń](https://powietrze.gios.gov.pl/pjp/archives)ś
2. ![Dane pogodowe cz.1.](https://www.ecad.eu/dailydata/predefinedseries.php)
3. ![Dane pogodowe cz.2.](https://open-meteo.com/en/docs/historical-weather-api)

## Bibliografia:
1. ![Gaussian_Plume_Model](https://faculty.washington.edu/markbenj/CEE357/CEE%20357%20air%20dispersion%20models.pdf)
2. 
3. 
4. ![Obracanie osi o zadany kąt - wzory](https://en.wikipedia.org/wiki/Rotation_of_axes)
5. 
Ponadto wykorzystano informacje i metody wprowadzone na innych kursach przeprowadzonych w ramach programu studiów.
