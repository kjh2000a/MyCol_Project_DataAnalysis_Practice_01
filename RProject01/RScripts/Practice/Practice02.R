##############################
# 연습 02 - 
##############################

#--------------------------------------------------

a <- c('A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K')
b <- c(2, 4, 5, 6, 12, 12, 1, 5, 3, 5, 7)
c <- c(6, 6, 3, 2, 3, 5, 12, 3, 11, 4, 6)
data <- data.frame(이름 = a, A점수 = b, B점수 = c, stringsAsFactors = FALSE)
data$이름 <- factor(data$이름)

data <- cbind(data, A평균 = mean(data$A점수)) # 평균
data <- cbind(data, A편차 = data$A점수 - m) # 편차

data <- cbind(data, B평균 = mean(data$B점수)) # 평균
data <- cbind(data, B편차 = data$B점수 - m) # 편차

plot(x = data$A점수, y = data$B점수)
plot(x = data$점수, y = data$편차, type = 'l')

#--------------------------------------------------

view(mtcars)
plot(x = mtcars$mpg)
plot(x = mtcars$mpg, y = mtcars$disp)

mtcars$mpg - mean(mtcars$mpg) #편차
var(mtcars$mpg)
sd(mtcars$mpg)
dnorm(mtcars$mpg, 0, 1) # mpg의 정규 분포 

plot(x = mtcars$mpg, y = dnorm(mtcars$mpg, 0, 3), axes = TRUE, xlab = 'mpg', ylab = '분포')
line(x = mtcars$mpg, y = dnorm(mtcars$mpg, 0, 2))

#무슨소리지???? 그래프 왜이래?

#--------------------------------------------------

# 평균, 편차, 분산, 표준편차, 정규분포도 이해하기
x <- seq(-3, 3, 0.01)
y1 <- dnorm(x, 0, 1) 
plot(x = x, y = y1)
y1 <- dnorm(x, 0, 2) 
plot(x = x, y = y1)
y1 <- dnorm(x, 0, 3) 
plot(x = x, y = y1)

dnorm(x = mtcars$mpg, mean = mean(mtcars$mpg)) #정규 분포도
plot(x = (mtcars$mpg - mean(mtcars$mpg)) - sd(mtcars$mpg), y = dnorm(x = mtcars$mpg, mean = mean(mtcars$mpg), sd = sd(mtcars$mpg)),
    xlab = '편차에서 표준편차 뺸 것', ylab = '정규분포')
#애가 정상 같다.
plot(x = mtcars$mpg - mean(mtcars$mpg), y = dnorm(x = mtcars$mpg, mean = mean(mtcars$mpg), sd = sd(mtcars$mpg)),
     xlab = '편차', ylab = '정규분포', col = 'Blue')
#애도 정상.
plot(x = mtcars$mpg, y = dnorm(x = mtcars$mpg, mean = mean(mtcars$mpg), sd = sd(mtcars$mpg)),
     xlab = 'mpg', ylab = '정규분포', col = 'Red')
plot(x = dnorm(x = mtcars$mpg, mean = mean(mtcars$mpg), sd = sd(mtcars$mpg)), y = mtcars$mpg,
     xlab = '정규분포', ylab = 'mpg', col = 'Red')
plot(x = mtcars$mpg, y = (mtcars$mpg - mean(mtcars$mpg)),
     xlab = 'mpg', ylab = '편차')
plot(x = (mtcars$mpg - mean(mtcars$mpg)), y = mtcars$mpg,
     xlab = '편차', ylab = 'mpg')
plot(x = mtcars$mpg, y = mtcars$mpg - sd(mtcars$mpg),
     xlab = 'mpg', ylab = '표준편차 뺀것')

#--------------------------------------------------

#plot 그리기
#plot
help(plot)
plot(0, main = 'Title', sub = 'SubTitle', xlab = 'X', ylab = 'Y', type = 'p', col = 'dark red')
plot(1:3)
plot(x = 5:10, y = 5:10)

#points
points(x = 1, y = 2, pch = 22, cex = 5, lwd = 'fig') #, bg = '')

plot(5:10, axes = FALSE)
plot(1:9, axes = TRUE, asp = 1) 

#lines
x <- -3:3
y <- x^2
plot(x, y, type = 'n')
lines(x, y)

#abline
plot(x = mtcars$mpg, y = dnorm(x = mtcars$mpg, mean = mean(mtcars$mpg), sd = sd(mtcars$mpg)),
     xlab = 'mpg', ylab = '정규분포', col = 'Red')
abline(h = 0.03, v = mean(mtcars$mpg))

#arrows
plot(1:9, axes = FALSE, type = 'n', xlab = '', ylab = '')#, main = 'arrow')
arrows(1, 9, 5, 5, length = 0.05, angle = 60, code = 3)

#title
title(main = '화살표', sub = '화살표 서브', 
      cex.main = 5, font.main = 4, 
      cex.sub = 3, font.sub = 3,
      col.main = 3)

#text
text(5, 5, '위치에 글자 찍기')

#rect
plot(1:9, axes = TRUE, type = 'n', xlab = '', ylab = '')#, main = 'arrow')
rect(1, 3, 3, 5)

#polygon - plot에는 원을 그릴 수가 없다. 그래서 폴리곤과 삼각함수를 활용.
#https://blog.naver.com/liberty264/220783785878


#--------------------------------------------------

mtcars$cyl
table(mtcars$cyl) # 갯수를 요약해준다.

#--------------------------------------------------