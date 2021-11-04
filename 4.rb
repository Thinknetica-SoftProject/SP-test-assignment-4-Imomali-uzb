## Задача №4:
#
# В соседнем районе рождественские эльфы готовят подарки для жителей города.
# Для каждого подарка (файл data/4.txt) нужно найти сколько оберточной бумаги потребуется.
# Формула рассчета: 2*ш*д + 2*д*в + 2*в*ш + площадь наименьшей стороны
# Например, на подарок размером 2х3х4 требуется 2*6 + 2*12 + 2*8 = 52 + 6 кв. см.
#
# Сколько всего оберточной бумаги нужно купить эльфам?
#
## Требования к решению:
# - Входные данные находятся в файле data/4.txt
# - В значениях данные длины, ширины и высоты не упорядочены и могут идти в любом порядке, однако
# длина всегда наименьшее число из трех, высота - среднее, ширина - самое большое.
# - Результат должен быть выведен в консоль командой puts
#
#
## Решение:
arr = Array.new
result = 0
File.open("data/4.txt", "r") do |file|
  arr = file.readlines
  for str in arr
    i = 0
    index = 0
    size = 0
    params = [0, 0, 0] #params is parametrs.
    str.each_char do |c|
      if (c != "x" && c != "\n")
        size += 1
      else
        params[index] = str[i, size].to_i
        i = i + size + 1
        index += 1
        size = 0
      end
    end
    sortedParams = params.sort
    length = sortedParams[0]
    heigth = sortedParams[1]
    width = sortedParams[2]
    result = result + 3*length*heigth + 2*length*width + 2*heigth*width
  end
  puts "#{result}"
end


