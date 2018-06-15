module AMAalgTests

# test AMAalg

import AMAFUNCS.reducedForm

# test AMAalg firmvalue example
function firmvalue()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


bb=[0.  0.228571  0.  0.;
0.  0.4  0.  0.;
0.  0.  0.  0.;
0.  0.  0.  1.]::Array{Float64,2}

rts=[1.1;
1.;
0.4]::Array{Float64,1}

ia=3::Int64

nex=3::Int64

nnum=0::Int64

lgrts=1::Int64

AMAcode=1::Int64

anEpsi=0.0000000001::Float64

(bbJulia,rtsJulia,iaJulia,nexJulia,nnumJulia,lgrtsJulia,AMAcodeJulia) = 
AMAalg(hh,neq,nlag,nlead,anEpsi,1+anEpsi)
isapprox(bbJulia,bb,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
isapprox(rtsJulia,rts,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
iaJulia==ia&&
nexJulia==nex&&
nnumJulia==nnum&&
iaJulia==ia
end;

# test AMAalg firmvalue3Leads2Lags example
function firmvalue3Leads2Lags()::Bool


neq=4::Int64;nlag=2::Int64;nlead=3::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


bb=[0.  0.0374804  0.  0.  0.  0.31179  0.  0.;
0.  0.4  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

rts=[-0.55 + 0.952628 im;
-0.55 - 0.952628 im;
1.1 + 0. im;
1. + 0. im;
0.632456 + 0. im;
-0.632456 + 0. im]::Array{Float64,1}

ia=6::Int64

nex=9::Int64

nnum=0::Int64

lgrts=3::Int64

AMAcode=1::Int64

anEpsi=0.0000000001::Float64

(bbJulia,rtsJulia,iaJulia,nexJulia,nnumJulia,lgrtsJulia,AMAcodeJulia) = 
AMAalg(hh,neq,nlag,nlead,anEpsi,1+anEpsi)
isapprox(bbJulia,bb,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
isapprox(rtsJulia,rts,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
iaJulia==ia&&
nexJulia==nex&&
nnumJulia==nnum&&
iaJulia==ia
end;

# test AMAalg example7 example
function example7()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


bb=[0.  0.  0.  -0.655141;
0.  0.  0.  -0.29452;
0.  0.  0.  -0.663972;
0.  0.  0.  0.336028]::Array{Float64,2}

rts=[1.31855 + 0.49536 im;
1.31855 - 0.49536 im;
0.336028 + 0. im]::Array{Float64,1}

ia=3::Int64

nex=2::Int64

nnum=0::Int64

lgrts=2::Int64

AMAcode=1::Int64

anEpsi=0.0000000001::Float64

(bbJulia,rtsJulia,iaJulia,nexJulia,nnumJulia,lgrtsJulia,AMAcodeJulia) = 
AMAalg(hh,neq,nlag,nlead,anEpsi,1+anEpsi)
isapprox(bbJulia,bb,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
isapprox(rtsJulia,rts,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
iaJulia==ia&&
nexJulia==nex&&
nnumJulia==nnum&&
iaJulia==ia
end;

# test AMAalg oneEquationNoLead example
function oneEquationNoLead()::Bool


neq=1::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


genJuliaMatInit[bb, -0.666667, Array{Float64,2}]

genJuliaMatInit[rts, -0.666667, Array{Float64,1}]

ia=1::Int64

nex=1::Int64

nnum=0::Int64

lgrts=0::Int64

AMAcode=1::Int64

anEpsi=0.0000000001::Float64

(bbJulia,rtsJulia,iaJulia,nexJulia,nnumJulia,lgrtsJulia,AMAcodeJulia) = 
AMAalg(hh,neq,nlag,nlead,anEpsi,1+anEpsi)
isapprox(bbJulia,bb,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
isapprox(rtsJulia,rts,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
iaJulia==ia&&
nexJulia==nex&&
nnumJulia==nnum&&
iaJulia==ia
end;

# test AMAalg reliablePaperExmpl example
function reliablePaperExmpl()::Bool


neq=5::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


bb=[0.  0.  0.  0.  0.;
0.  0.  0.  0.00000000000000000159422  0.;
0.  0.  0.  0.214101  0.;
0.  0.  0.  0.361236  0.;
0.  0.  0.  0.530747  0.]::Array{Float64,2}

rts=[1.06383 + 1.39432 im;
1.06383 - 1.39432 im;
0.361236 + 0. im;
0. + 0. im]::Array{Float64,1}

ia=4::Int64

nex=3::Int64

nnum=0::Int64

lgrts=2::Int64

AMAcode=1::Int64

anEpsi=0.0000000001::Float64

(bbJulia,rtsJulia,iaJulia,nexJulia,nnumJulia,lgrtsJulia,AMAcodeJulia) = 
AMAalg(hh,neq,nlag,nlead,anEpsi,1+anEpsi)
isapprox(bbJulia,bb,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
isapprox(rtsJulia,rts,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
iaJulia==ia&&
nexJulia==nex&&
nnumJulia==nnum&&
iaJulia==ia
end;

# test AMAalg athan example
function athan()::Bool


neq=9::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


bb=[0.828597  0.296449  -0.11369  0.212332  0.  0.  0.  0.  0.;
0.293  0.764  -0.293  0.  0.  0.  0.  0.  0.;
1.95019  1.3569  -0.520381  -0.486336  0.  0.  0.  0.  0.;
0.  0.  0.  0.911  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

rts=[1.39878 + 0. im;
1. + 0. im;
0.911 + 0. im;
0.536108 + 0.222056 im;
0.536108 - 0.222056 im;
0.000000000000000166533 + 0. im;
0. + 0. im]::Array{Float64,1}

ia=7::Int64

nex=8::Int64

nnum=0::Int64

lgrts=1::Int64

AMAcode=1::Int64

anEpsi=0.0000000001::Float64

(bbJulia,rtsJulia,iaJulia,nexJulia,nnumJulia,lgrtsJulia,AMAcodeJulia) = 
AMAalg(hh,neq,nlag,nlead,anEpsi,1+anEpsi)
isapprox(bbJulia,bb,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
isapprox(rtsJulia,rts,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
iaJulia==ia&&
nexJulia==nex&&
nnumJulia==nnum&&
iaJulia==ia
end;

# test AMAalg habitmod example
function habitmod()::Bool


neq=12::Int64;nlag=4::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


bb=[0.0275299  0.  0.0204675  0.00384168  0.0510466  0.  0.  0.  0.  0.  0.  0.  -0.150125  0.  0.0802913  -0.0569634  0.0332227  0.  0.  0.  0.  0.  0.  0.  0.00762739  0.  0.132004  -0.000975575  0.140907  0.  0.  0.  0.  0.  0.  0.  0.409592  0.531564  0.281743  -0.370309  -0.00715738  0.  0.000594579  0.  0.  0.  0.  0.0247319;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.88879  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
-0.52802  0.  -0.11279  -0.031833  -0.024734  0.  0.  0.  0.  0.  0.  0.  0.71526  0.  -0.042076  0.22829  0.012267  0.  0.  0.  0.  0.  0.  0.  -0.22215  0.  0.14172  -0.26679  0.11959  0.  0.  0.  0.  0.  0.  0.  0.42308  0.  0.61076  0.10946  -0.17172  0.  0.  0.  0.  0.  0.  0.00011277;
-0.46436  0.  -0.16131  -0.02744  -0.17087  0.  0.  0.  0.  0.  0.  0.  1.3425  0.  -0.16794  0.35818  0.09837  0.  0.  0.  0.  0.  0.  0.  -1.06382  0.  0.02255  -0.51594  -0.08949  0.  0.  0.  0.  0.  0.  0.  0.46672  0.  0.11369  1.10657  0.26021  0.  0.  0.  0.  0.  0.  0.00141;
0.23292  0.  -0.08512  0.04213  -0.14149  0.  0.  0.  0.  0.  0.  0.  -0.03313  0.  -0.15223  -0.01572  0.34762  0.  0.  0.  0.  0.  0.  0.  -0.70552  0.  0.24697  -0.21888  0.07805  0.  0.  0.  0.  0.  0.  0.  0.56316  0.  0.08268  0.16054  0.68637  0.  0.  0.  0.  0.  0.  0.00348;
-0.0486562  0.  -0.0143582  -0.00361503  -0.0163681  0.  0.  0.  0.  0.  0.  0.  0.0963933  0.  -0.0262052  0.0337474  -0.00907889  0.  0.  0.  0.  0.  0.  0.  -0.0178323  0.  -0.0276432  -0.0192967  -0.0320882  0.  0.  0.  0.  0.  0.  0.  0.0410416  0.105222  -0.0348985  0.115168  -0.012502  0.  0.0000156628  0.  0.  0.  0.  0.0265769;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.99853  0.  0.  0.  0.  0.  0.00147  0.  0.  0.  0.  0.;
0.0265517  0.  0.019758  0.00370218  0.0492574  0.  0.  0.  0.  0.  0.  0.  -0.145004  0.  0.0774512  -0.0549674  0.0320274  0.  0.  0.  0.  0.  0.  0.  0.00761162  0.  0.127323  -0.000854112  0.135885  0.  0.  0.  0.  0.  0.  0.  -25.5133  0.512756  0.27179  -0.35728  -0.00690759  0.  -0.0375677  0.  0.  0.  0.  0.02386;
0.521517  0.  0.1143  0.0309276  0.0282826  0.  0.  0.  0.  0.  0.  0.  -0.724878  0.  0.0467801  -0.229153  -0.0155764  0.  0.  0.  0.  0.  0.  0.  0.232646  0.  -0.140072  0.271375  -0.122108  0.  0.  0.  0.  0.  0.  0.  -0.421116  0.0172992  -0.603894  -0.115681  0.153917  0.  0.00000222775  0.  0.  0.  0.  0.00504552;
0.0235796  0.  -0.0818094  0.0108053  -0.152502  0.  0.  0.  0.  0.  0.  0.  0.436271  0.  -0.246456  0.127264  0.0284865  0.  0.  0.  0.  0.  0.  0.  -0.248762  0.  -0.221058  -0.110815  -0.0970434  0.  0.  0.  0.  0.  0.  0.  25.5232  -0.947988  -0.416326  0.61486  0.420138  0.  0.0375093  0.  0.  0.  0.  -0.152162;
-0.00201156  0.  0.00248092  -0.000581449  0.00412511  0.  0.  0.  0.  0.  0.  0.  -0.0116365  0.  0.00675309  -0.00288513  -0.00242817  0.  0.  0.  0.  0.  0.  0.  0.00965336  0.  0.00373112  0.00447091  -0.00157814  0.  0.  0.  0.  0.  0.  0.  -0.998996  0.0173377  0.00574045  -0.0102517  -0.0165428  0.  -0.00146776  0.  0.  0.  0.  0.00513261;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

rts=[679.579 + 0. im;
1.11741 + 0. im;
1.00424 + 0. im;
1.00424 + 0. im;
1.00403 + 0. im;
1. + 0. im;
0.918128 + 0.0887657 im;
0.918128 - 0.0887657 im;
0.88879 + 0. im;
0.714747 + 0. im;
0.587349 + 0.26613 im;
0.587349 - 0.26613 im;
-0.129115 + 0.619993 im;
-0.129115 - 0.619993 im;
-0.294489 + 0.507462 im;
-0.294489 - 0.507462 im;
-0.230764 + 0.281568 im;
-0.230764 - 0.281568 im;
0.198899 + 0.16454 im;
0.198899 - 0.16454 im;
-0.000096719 + 0.0000998847 im;
-0.000096719 - 0.0000998847 im;
0.000096719 + 0.0000934444 im;
0.000096719 - 0.0000934444 im]::Array{Float64,1}

ia=24::Int64

nex=7::Int64

nnum=0::Int64

lgrts=5::Int64

AMAcode=1::Int64

anEpsi=0.0000000001::Float64

(bbJulia,rtsJulia,iaJulia,nexJulia,nnumJulia,lgrtsJulia,AMAcodeJulia) = 
AMAalg(hh,neq,nlag,nlead,anEpsi,1+anEpsi)
isapprox(bbJulia,bb,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
isapprox(rtsJulia,rts,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
iaJulia==ia&&
nexJulia==nex&&
nnumJulia==nnum&&
iaJulia==ia
end;

end