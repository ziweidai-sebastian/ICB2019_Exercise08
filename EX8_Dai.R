#Score Plotting
UWvMSU <- read.table("UWvMSU_1-22-13.txt")
UW_data <- UWvMSU[UWvMSU$V2 == "UW",]
MSU_data <- UWvMSU[UWvMSU$V2 == "MSU",]
UW_time <- as.data.frame(UW_data$V1)
MSU_time <- as.data.frame(MSU_data$V1)
UW_score <- as.numeric(UW_data$V3)
MSU_score <- as.numeric(MSU_data$V3)

initial_score_UW <- UW_score[1]
write(initial_score_UW,file = "UW_total_score.txt")
for(i in seq(2,nrow(as.data.frame(UW_score)))){
  UW_total_score <- as.data.frame(read.table("UW_total_score.txt"))
  write(sum(UW_score[i],as.numeric(UW_total_score[i-1,])),file = "UW_total_score.txt",append = TRUE)
}
UW_total_score <- as.data.frame(read.table("UW_total_score.txt"))

initial_score_MSU <- MSU_score[1]
write(initial_score_MSU,file = "MSU_total_score.txt")
for(i in seq(2,nrow(as.data.frame(MSU_score)))){
  MSU_total_score <- as.data.frame(read.table("MSU_total_score.txt"))
  write(sum(MSU_score[i],as.numeric(MSU_total_score[i-1,])),file = "MSU_total_score.txt",append = TRUE)
}
MSU_total_score <- as.data.frame(read.table("MSU_total_score.txt"))

UW_time <- as.numeric(as.vector(UW_time[-1,]))
UW_total_score <- as.numeric(as.vector((UW_total_score[-1,])))
MSU_time <- as.numeric(as.vector(MSU_time[-1,]))
MSU_total_score <- as.numeric(as.vector(MSU_total_score[-1,]))

plot(UW_time,UW_total_score,type="o", col="blue", pch="o", xlab ="Time", ylab ="Cumulative Score")
points(MSU_time, MSU_total_score,col="red", pch="*")
lines(MSU_time, MSU_total_score, col="red",lty=2)
legend(5, 40, legend=c("MSU", "UW"),col=c("red", "blue"), lty=1:2, cex=0.8)

#Guessing number
random_number <- sample(1:100,1)
for(i in seq(1:10)){
  user_guess <- readline(prompt = "Enter your guess: ")
  user_guess <- as.numeric(user_guess)
  if (user_guess < random_number) {
    print("Higher")
  }
  if (user_guess > random_number) {
    print("Lower")
  }
  if (user_guess == random_number) {
    print("Correct")
    break
  }
}
