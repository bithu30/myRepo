#loading the datasets
df_master     <- read.csv('Model Build - Demographics.csv')
df_loan       <- read.csv('Target Variable - Purchased Loan Flag.csv')
df_prev_loan  <- read.csv('Model Build - Previous Loan Holdings.csv')
df_txn_amt    <- read.csv('Model Build - TXN Amount.csv',col.names=c('Client','Txn Amt'),header = F)
df_trans_CA   <- read.csv('Model Build - Transactions out of Current Account.csv')
df_products  <- read.csv('Model Build - Product Held in Bank.csv',col.names=c('Client','Products Held'),header = F)
#combining datasets , all relevant data is collated in df_master

df_master['loan_flg'] <- df_loan['Loan.Flag']

df_master['prev_loan_flg'] <- df_prev_loan['Held.Loan.previously']


#Question1 ???	How Many Customers above 50 years old have taken up a loan?
#Answer1     98

df_loan_above50 <- subset(df_master,(Age > 50 & loan_flg == 1) )