aggregateTime2Days=function(Time,Data,FUN,Header,...){
  
  if(missing(Header)){
    if(is.matrix(Data)|is.data.frame(Data)){
      if(length(Time)!=nrow(Data)) stop('Unequal number of rows in Data compared to Time')
      Header=colnames(Data)
    }else{
    Header='Data'
    if(length(Time)!=length(Data)) stop('Unequal length in Data compared to Time')
    }
  }

if(is.vector(Data)){
  DF=data.frame(Time=Time,Data=Data)
  DF$Time=cut(Time,breaks='days')
  dsummary = aggregate(DF$Data ~ DF$Time, FUN=FUN,    data=DF,...)
  colnames(dsummary)=c('Time',Header)
  dsummary$Time=as.Date(dsummary$Time)
}else{
  for(i in 1:ncol(Data)){
    if(i==1){
      dsummary=aggregateTime2Days(Time,as.vector(Data[,i]),FUN,Header[i],...)
    }else{
      DFtemp=aggregateTime2Days(Time,as.vector(Data[,i]),FUN,Header[i],...)
      dsummary=merge(dsummary,DFtemp,'Time','Time')
    }
   
  }
}
  return(dsummary)
}