#import "@preview/great-theorems:0.1.2": *
#import "@preview/fletcher:0.5.8": *

#set document(
    title: "Конспект по математическому анализу",
)
#set page("a4")
#set text(12pt)
#set par(justify: true)
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
    fill: oklch(91.23%, 0.103, 128.85deg),
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
    fill: blue.lighten(90%),
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

#align(center)[= Теория представлений конечных групп.]
#v(2em)

#lecture("12.02.2026")
