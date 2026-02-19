#import "@preview/great-theorems:0.1.2": *
#import "@preview/fletcher:0.5.8": *

#set document(
    title: "Конспект по комплексному анализу",
)
#set page("a4")
#set page(margin: 1.5cm)
#set text(12pt)
#set heading(numbering: "1.")

#show: great-theorems-init

#let theorem = mathblock(
    blocktitle: "Теорема",
    counter: none,
    fill: color.linear-rgb(100%, 63.76%, 63.76%), 
    inset: 10pt,
    radius: 5pt,
)

#let lemma = mathblock(
    blocktitle: "Лемма",
    counter: none,
    fill: oklab(95.23%, -0.068, 0.032),
    inset: 10pt,
)

#let proposition = mathblock(
    blocktitle: "Предложение",
    counter: none,
    fill: oklch(91.47%, 0.169, 117.19deg),
    inset: 10pt,
)

#let definition = mathblock(
    blocktitle: "Определение",
    counter: none, 
    fill: blue.lighten(80%),
    inset: 10pt,
    radius: 5pt,
)

#let remark = mathblock(
    blocktitle: "Замечание",
    counter: none, 
    fill: oklch(83.83%, 0.012, 264.5deg),
    inset: 10pt,
    radius: 5pt,
)

#let example = mathblock(
    blocktitle: "Пример",
    counter: none, 
    fill: oklch(87.86%, 0.121, 129.16deg),
    inset: 10pt,
    radius: 5pt,
)

#let problemCounter = counter("problem")

#let problem = mathblock(
    blocktitle: "Задача",
    counter: problemCounter, 
    fill: oklch(87.86%, 0.121, 129.16deg),
    inset: 10pt,
    radius: 5pt,
)

#let proof = proofblock(prefix: [_Доказательство_:#h(1cm)], suffix: [#h(1fr) $square$])

#let lecture(date) =[
  #v(2em)
  #text(16pt, weight: "bold")[Лекция от #date]
  #line(length: 40%, stroke: 0.5pt)
  #v(1em)
]

#align(center + horizon)[
    #show title: set text(size: 24pt, weight: "bold")
    #title()
    #v(1.5em)
    #text(18pt)[Лектор: Белов Юрий Сергеевич]
    #v(1.5em)
    #text(18pt)[Автор: Артемий Дружинин]
    #v(1em)
    #text(14pt)[Факультет МКН СПБГУ]
    #v(1em)
    #text(12pt)[Весенний семестр 2026]
]

#pagebreak()

#lecture("12.02.2026")
 (still in progress)

#proof[

#lecture("19.02.2026")
    Продолжаем доказывать теорему о том что $f$ - аналитична в $G$ $<==>$ $f$ - голоморфна в $G$.\
    Осталось доказать, что если $f(z) d z$ - замкнута $==>$ $f$ - голоморфна:\
    Пусть $B_r (a)$ - шар, замыкание которого в $G$, $space w, z in B_r:$
    $ 
    space g_w (z) = (f(z)-f(w))/ (z-w)
    $
    $g$ голоморфна. Также $g$ ограничена в окрестности $w$. По лемме об устранении особенности $g(z) d z$ - замкнута в $B_r$.\
    $
    0 = integral_limits(gamma_r) g(z) d z = integral_limits(gamma_r) (f(z)-f(w))/ (z-w) d w space ==>\
    integral_limits(gamma_r) f(w)/ (z-w) d w = integral_limits(gamma_r) f(z)/ (z-w) d w = f(z) integral_limits(gamma_r) (d w)/ (z-w) 
    $
    Заметим, что $|w-a|>z-a$, тогда:
    $
    1 / (z-w) = 1 / ((z-a)-(w-a)) = - 1 / (w-a) dot 1/ (1-(z-a)/(v-a)) = 1 / (w-a) dot sum_limits(n=0)^oo ((z-a)/(w-a))^n = sum_limits(n=0)^oo (z-a)^n/(w-a)^(n+1)
    $
    Тогда интеграл: 
    $
    integral_limits(gamma_r) (d w)/ (z-w) = - integral_limits(gamma_r) (d w)/ (w-a)^n = - integral_limits(0)^(2 pi) (d (r e^(i t)))/ (r^n e^(i t)) = - i integral_limits(0)^(2 pi) r^(1-n) dot e^(i(1-n)t)d t = - 2pi i space ==>\
        f(z) =  1/(2pi i) integral_limits(gamma_r) f(w)/ (w-z) d w
    $
    Разложим в степенной ряд:
    $
      f(z) = sum_limits(n=0)^oo 1/(2pi i) [integral_limits(gamma_r) f(w)/ (w-a)^(n+1) d w] dot (z-a)^n = sum_limits(n=0)^oo C_n (z-a)^n, " где " C_n = (f^((n))(a)) / (n!)
    $
    Тогда $f$ - голоморфна.
]

#remark[
    Можно заметить что радиус сходимости ряда $gt.eq d(a, partial G)$, то есть, радиус сходимости напярмую зависит от размера области аналитичности.
]

#example[
    Рассмотрим функцию $1/(1+z^2)$ - ее радиус сходимости равен $1$ в точке $0$, также мы не можем взять шар в котором она аналитична радиуса больше 1, т.к. она устремляется в бесконечность в точках $i, -i$
]

#theorem[(Морера)
 Пусть $G in CC$ - открытая область, тогда следующие условия равносильны:
 + $f$ - аналитична $G$
 + $f$ - голоморфна в $G$
 + форма $f(z) d z$ - локально точна
]

*В этот самый момент до меня дошло, что конспект 2023 годда Магина и Семидетнова в точности до тривиальных примеров и замечаний повторяет текущий курс, в связи с этим больше не вижу смысла продолжать.*\ 
#show link: set text(fill: blue)
#link("https://docs.yandex.ru/docs/view?url=ya-disk-public%3A%2F%2FioKxrC%2FtYk%2BjzR9b3JM8Kcci%2BX7OgdBj0Ch%2Bui3mjryHCHjg80ODzTx%2FlGErGaPIq%2FJ6bpmRyOJonT3VoXnDag%3D%3D%3A%2F2-semester-2022S%2FMathematical-Analysis%2FMA_Abstract.pdf&name=MA_Abstract.pdf")[ссылка на конспект]
