##############################
# 함수 타입
##############################

# 로직 패턴화가 꽤 어렵네.
func_TypeVector <- function(count, skip = 0, pattern){
  v <- vector(mode = 'any', length = count)
  for(i in length(v)){
    if(i <= skip){
      next
    }else{
      
    }
  }
  v
}