#subject 1
# 安装多个包
install.packages(c("tidyverse", "ggplot2", "ade4"))

#加载所需的包
library(tidyverse) #用于数据操作和可视化
library(ade4) #用于多元数据分析

#加载数据
data(doubs)

#查看数据
head(doubs)

#检查数据类型
class(doubs)

#subject2
#安装tibble数据包
install.packages("tibble")

library(tibble) # 加载 tibble 包

my_data <- doubs$env # 提取 env 数据框并赋值给 my_data

# 将行名转换为列名
my_data$site <- rownames(my_data)
rownames(my_data) <- NULL

# 将数据框转换为 tibble
env_tb <- as_tibble(my_data)

#subject3
#3.1 a <- env_tb[env_tb$dfs > 1000, ]   #"[]"子集运算符，允许从数据框中选择特定的列
#3.2 b <- env_tb[, c("site", "dfs", "slo", "flo", "pH", "nit", "oxy")]    #[, c(...)] 是子集运算符的一种形式，其中 c(...) 表示你想要选择的列的名称,这行代码中的","表示选择所有的行
#3.3 names(env_tb)[names(env_tb) == "dfs"] <- "distsour"
     #names(env_tb)[names(env_tb) == "slo"] <- "slope"
     #names(env_tb)[names(env_tb) == "flo"] <- "flowrate"
     #names(env_tb)[names(env_tb) == "nit"] <- "nitrogen"
     #names(env_tb)[names(env_tb) == "oxy"] <- "oxygen"
     #names() 函数来获取数据框的列名，并使用条件语句 [names(my_data) == "列名"] 来选择要重命名的列。"<-" 运算符将新名称赋给选定的列
#3.4 library(dplyr)  c <- env_tb %>% arrange(slope, desc(pH))
# 使用管道符 %>% 将多个步骤连接起来，并将结果存储在一个名为 env_final 的最终变量中

install.packages("dplyr")

library(dplyr)

env_final <- my_data %>%
  select(site, dfs, slo, flo, pH, nit, oxy) %>%
  rename(distsour = dfs, slope = slo, flowrate = flo, nitrogen = nit, oxygen = oxy) %>%
  filter(distsour > 1000) %>%
  arrange(slope, desc(pH)) %>%
  as_tibble()
