FourierAnalysis=function(Y,SamplingRate,AdjustWindow=FALSE,na.rm = FALSE,PlotIt=FALSE){
  N=length(Y)
  if(isTRUE(AdjustWindow)){
    Y=c(Y,rev(Y))
  
    Y=c(Y,Y)
    N=length(Y)
    FFT=FastFourierTransformation(Y,na.rm = na.rm)
   
    if(missing(SamplingRate))
      freq <- FFT$Frequencies
    else
      freq <- FFT$Frequencies*SamplingRate
    #print(freq[1:50])
    PSD <- cbind(freq,FFT$Amplitude)
    colnames(PSD)=c('Frequency','Amplitude')
    #first is DC, second is window frequency
    PSD=PSD[3:(floor(N/2)),]
  }else{
    FFT=FastFourierTransformation(Y,na.rm = na.rm)
    
    if(missing(SamplingRate))
      freq <- FFT$Frequencies
    else
      freq <- FFT$Frequencies*SamplingRate
    #print(freq[1:50])
    PSD <- cbind(freq,FFT$Amplitude)
    colnames(PSD)=c('Frequency','Amplitude')
    #first is DC, second is window frequency
    PSD=PSD[1:(floor(N/2)),]
  }
  if(isTRUE(PlotIt)){
    obj=ggplot2::ggplot(data = as.data.frame(PSD), ggplot2::aes_string('Frequency','Amplitude')) + ggplot2::geom_bar(stat = "identity")+ggplot2::ggtitle('Frequency Domain')
  print(obj)
  }else{
    obj=NULL
  }
  return(list(PowerSpectrum=PSD,FFT=FFT,ggObject=obj))
}
