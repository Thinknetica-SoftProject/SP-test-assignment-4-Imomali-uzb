## Задача №3:
#
# Джон добрался до этажа с бомбой, но у него на пути стоит дверь с кодовым замком и рядом бумажка с инструкциями (файл data/3.txt)
#
# Чтобы узнать код от замка, ему нужно для каждой строки найти разницу между наибольшим и наименьшим числами и потом сложить полученные значения
#
## Требования к решению:
# - Входные данные находятся в файле data/3.txt (разделитель значений - символ табуляции)
# - Результат должен быть выведен в консоль командой puts
#
## Решение:
arr = Array.new
result = 0

File.open("data/3.txt", "r") do |file|
  arr = file.readlines

  for str in arr do
    i = 0
    size = 0
    maxNum = 0
    minNum = 0
    newNum = 0
    str.each_char do |c|
      if (c != "\t" && c != "\n")
        size += 1
      else
        newNum = str[i, size].to_i
        if i == 0
          minNum = newNum
          maxNum = newNum
        else
          if (newNum > maxNum)
            maxNum = newNum
          elsif (newNum < minNum)
            minNum = newNum
          end
        end
        i = i + size + 1
        size = 0
      end
    end
    result = result + (maxNum - minNum)
  end
  puts "#{result}"
end

