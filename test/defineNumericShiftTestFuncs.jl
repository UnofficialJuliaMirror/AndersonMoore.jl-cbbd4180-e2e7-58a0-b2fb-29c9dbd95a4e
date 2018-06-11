module NumericShiftTests

# test numericShift 
import AMAFUNCS.numericShift

# test numericShift firmvalue example
function firmvalue()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


qq=zeros(Float64,4,8)

hhIn=[0.  0.  0.  0.  -1.1  0.  0.  0.  1.  1.  0.  0.;
0.  -0.4  0.  0.  0.  1.  -1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.;
0.  0.  0.  -1.  0.  0.  0.  1.  0.  0.  0.  0.]::Array{Float64,2}

hNewMatlab=[0.  0.  0.  0.  -1.1  0.  0.  0.  1.  1.  0.  0.;
0.  0.  0.  0.  0.  -0.4  0.  0.  0.  1.  -1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.;
0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.]::Array{Float64,2}

qNewMatlab=[0.  -0.4  0.  0.  0.  1.  -1.  0.;
0.  0.  0.  0.  0.  0.  1.  0.;
0.  0.  0.  -1.  0.  0.  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

iqNewMatlab=3

nnumericMatlab=0

(hNewJulia,qNewJulia,iqNew,nnumeric)=numericShift(hhIn,qq,0,qRows,qCols,neq)
isapprox(hNewJulia,hNewMatlab,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
sameSpan(qNewJulia,qNewMatlab)&&
iqNew==iqNewMatlab&&
nnumeric==nnumericNewMatlab
end;

# test numericShift firmvalue3Leads2Lags example
function firmvalue3Leads2Lags()::Bool


neq=4::Int64;nlag=2::Int64;nlead=3::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


qq=zeros(Float64,12,20)

hhIn=[0.  0.  0.  0.  0.  0.  0.  0.  -1.331  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.;
0.  -0.4  0.  0.  0.  0.  0.  0.  0.  1.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

hNewMatlab=[0.  0.  0.  0.  0.  0.  0.  0.  -1.331  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.4  0.  0.  0.  0.  0.  0.  0.  1.  -1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.]::Array{Float64,2}

qNewMatlab=[0.  -0.4  0.  0.  0.  0.  0.  0.  0.  1.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  -0.4  0.  0.  0.  0.  0.  0.  0.  1.  -1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.4  0.  0.  0.  0.  0.  0.  0.  1.  -1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

iqNewMatlab=9

nnumericMatlab=0

(hNewJulia,qNewJulia,iqNew,nnumeric)=numericShift(hhIn,qq,0,qRows,qCols,neq)
isapprox(hNewJulia,hNewMatlab,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
sameSpan(qNewJulia,qNewMatlab)&&
iqNew==iqNewMatlab&&
nnumeric==nnumericNewMatlab
end;

# test numericShift example7 example
function example7()::Bool


neq=4::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


qq=zeros(Float64,4,8)

hhIn=[0.  0.  0.  0.  1.  0.  0.  1.  -1.  -1.  0.  0.;
0.  0.  0.  0.  -0.3  1.  0.  0.  0.  -0.99  0.  0.;
0.  0.  0.  1.  0.  0.  1.  -1.  0.  0.  0.  0.;
0.  0.  0.  -0.66  0.  -1.1  0.  1.  0.  0.  0.  0.]::Array{Float64,2}

hNewMatlab=[0.  0.  0.  0.  1.  0.  0.  1.  -1.  -1.  0.  0.;
0.  0.  0.  0.  -0.3  1.  0.  0.  0.  -0.99  0.  0.;
0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  1.  -1.;
0.  0.  0.  0.  0.  0.  0.  -0.66  0.  -1.1  0.  1.]::Array{Float64,2}

qNewMatlab=[0.  0.  0.  1.  0.  0.  1.  -1.;
0.  0.  0.  -0.66  0.  -1.1  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

iqNewMatlab=2

nnumericMatlab=0

(hNewJulia,qNewJulia,iqNew,nnumeric)=numericShift(hhIn,qq,0,qRows,qCols,neq)
isapprox(hNewJulia,hNewMatlab,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
sameSpan(qNewJulia,qNewMatlab)&&
iqNew==iqNewMatlab&&
nnumeric==nnumericNewMatlab
end;

# test numericShift oneEquationNoLead example
function oneEquationNoLead()::Bool


neq=1::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


qq=zeros(Float64,1,2)

hhIn=[2.  3.  0.]::Array{Float64,2}

hNewMatlab=[0.  2.  3.]::Array{Float64,2}

qNewMatlab=[2.  3.]::Array{Float64,2}

iqNewMatlab=1

nnumericMatlab=0

(hNewJulia,qNewJulia,iqNew,nnumeric)=numericShift(hhIn,qq,0,qRows,qCols,neq)
isapprox(hNewJulia,hNewMatlab,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
sameSpan(qNewJulia,qNewMatlab)&&
iqNew==iqNewMatlab&&
nnumeric==nnumericNewMatlab
end;

# test numericShift reliablePaperExmpl example
function reliablePaperExmpl()::Bool


neq=5::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


qq=zeros(Float64,5,10)

hhIn=[0.  0.  0.  -0.5  0.  0.  -1.  0.7  -0.5  1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  1.  -0.5  0.  0.  0.  0.  -0.5;
0.  0.  0.  0.  0.  -1.  0.  1.  -0.4  0.  0.  0.  -0.9  0.  0.;
0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

hNewMatlab=[0.  0.  0.  0.  0.  0.  0.  0.  -0.5  0.  0.  -1.  0.7  -0.5  1.;
0.  0.  0.  0.  0.  0.  0.  0.  1.  -0.5  0.  0.  0.  0.  -0.5;
0.  0.  0.  0.  0.  -1.  0.  1.  -0.4  0.  0.  0.  -0.9  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.]::Array{Float64,2}

qNewMatlab=[0.  0.  0.  -0.5  0.  0.  -1.  0.7  -0.5  1.;
0.  0.  0.  0.  0.  1.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

iqNewMatlab=3

nnumericMatlab=0

(hNewJulia,qNewJulia,iqNew,nnumeric)=numericShift(hhIn,qq,0,qRows,qCols,neq)
isapprox(hNewJulia,hNewMatlab,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
sameSpan(qNewJulia,qNewMatlab)&&
iqNew==iqNewMatlab&&
nnumeric==nnumericNewMatlab
end;

# test numericShift athan example
function athan()::Bool


neq=9::Int64;nlag=1::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


qq=zeros(Float64,9,18)

hhIn=[-0.5  0.  0.  0.  0.  0.  0.  0.  0.  1.  -0.18  0.  0.  -1.  0.  0.  0.  0.  -0.5  0.  0.  0.  0.  0.  0.  0.  0.;
-0.293  -0.764  0.293  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  -2.  -1.  1.  1.  0.  0.  2.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  -0.911  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

hNewMatlab=[-0.5  0.  0.  0.  0.  0.  0.  0.  0.  1.  -0.18  0.  0.  -1.  0.  0.  0.  0.  -0.5  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.293  -0.764  0.293  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  -1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -2.  -1.  1.  1.  0.  0.  2.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.911  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  -1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

qNewMatlab=[-0.293  -0.764  0.293  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  -1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  -2.  -1.  1.  1.  0.  0.  2.  0.  0.;
0.  0.  0.  -0.911  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  -1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

iqNewMatlab=8

nnumericMatlab=0

(hNewJulia,qNewJulia,iqNew,nnumeric)=numericShift(hhIn,qq,0,qRows,qCols,neq)
isapprox(hNewJulia,hNewMatlab,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
sameSpan(qNewJulia,qNewMatlab)&&
iqNew==iqNewMatlab&&
nnumeric==nnumericNewMatlab
end;

# test numericShift habitmod example
function habitmod()::Bool


neq=12::Int64;nlag=4::Int64;nlead=1::Int64
qRows=(neq*nlead)::Int64;qCols=(neq*(nlag+nlead))::Int64


qq=zeros(Float64,12,60)

hhIn=[0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  -1.  -1.  0.  0.  3.45419  0.  0.  -0.74118  0.00208517  0.494116  -0.1149  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.88879  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.52802  0.  0.11279  0.031833  0.024734  0.  0.  0.  0.  0.  0.  0.  -0.71526  0.  0.042076  -0.22829  -0.012267  0.  0.  0.  0.  0.  0.  0.  0.22215  0.  -0.14172  0.26679  -0.11959  0.  0.  0.  0.  0.  0.  0.  -0.42308  0.  -0.61076  -0.10946  0.17172  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  -0.00011277  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.46436  0.  0.16131  0.02744  0.17087  0.  0.  0.  0.  0.  0.  0.  -1.3425  0.  0.16794  -0.35818  -0.09837  0.  0.  0.  0.  0.  0.  0.  1.06382  0.  -0.02255  0.51594  0.08949  0.  0.  0.  0.  0.  0.  0.  -0.46672  0.  -0.11369  -1.10657  -0.26021  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  -0.00141  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
-0.23292  0.  0.08512  -0.04213  0.14149  0.  0.  0.  0.  0.  0.  0.  0.03313  0.  0.15223  0.01572  -0.34762  0.  0.  0.  0.  0.  0.  0.  0.70552  0.  -0.24697  0.21888  -0.07805  0.  0.  0.  0.  0.  0.  0.  -0.56316  0.  -0.08268  -0.16054  -0.68637  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  -0.00348  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  -41.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  40.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.99853  0.  0.  0.  0.  0.  -0.00147  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.00083  0.  0.  0.  0.  0.  25.9459  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.00146853  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  -0.99578  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  -0.99578  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  -0.99578  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

hNewMatlab=[0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  -1.  -1.  0.  0.  3.45419  0.  0.  -0.74118  0.00208517  0.494116  -0.1149;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.88879  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.52802  0.  0.11279  0.031833  0.024734  0.  0.  0.  0.  0.  0.  0.  -0.71526  0.  0.042076  -0.22829  -0.012267  0.  0.  0.  0.  0.  0.  0.  0.22215  0.  -0.14172  0.26679  -0.11959  0.  0.  0.  0.  0.  0.  0.  -0.42308  0.  -0.61076  -0.10946  0.17172  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  -0.00011277;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.46436  0.  0.16131  0.02744  0.17087  0.  0.  0.  0.  0.  0.  0.  -1.3425  0.  0.16794  -0.35818  -0.09837  0.  0.  0.  0.  0.  0.  0.  1.06382  0.  -0.02255  0.51594  0.08949  0.  0.  0.  0.  0.  0.  0.  -0.46672  0.  -0.11369  -1.10657  -0.26021  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  -0.00141;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.23292  0.  0.08512  -0.04213  0.14149  0.  0.  0.  0.  0.  0.  0.  0.03313  0.  0.15223  0.01572  -0.34762  0.  0.  0.  0.  0.  0.  0.  0.70552  0.  -0.24697  0.21888  -0.07805  0.  0.  0.  0.  0.  0.  0.  -0.56316  0.  -0.08268  -0.16054  -0.68637  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  -0.00348;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  -41.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  40.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.99853  0.  0.  0.  0.  0.  -0.00147  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.00083  0.  0.  0.  0.  0.  25.9459  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.00146853  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  -0.99578  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  -0.99578  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  -0.99578  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.]::Array{Float64,2}

qNewMatlab=[0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  -1.  -1.  0.  0.  3.45419  0.  0.  -0.74118  0.00208517  0.494116  -0.1149;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.88879  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.52802  0.  0.11279  0.031833  0.024734  0.  0.  0.  0.  0.  0.  0.  -0.71526  0.  0.042076  -0.22829  -0.012267  0.  0.  0.  0.  0.  0.  0.  0.22215  0.  -0.14172  0.26679  -0.11959  0.  0.  0.  0.  0.  0.  0.  -0.42308  0.  -0.61076  -0.10946  0.17172  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  0.  -0.00011277;
0.46436  0.  0.16131  0.02744  0.17087  0.  0.  0.  0.  0.  0.  0.  -1.3425  0.  0.16794  -0.35818  -0.09837  0.  0.  0.  0.  0.  0.  0.  1.06382  0.  -0.02255  0.51594  0.08949  0.  0.  0.  0.  0.  0.  0.  -0.46672  0.  -0.11369  -1.10657  -0.26021  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  0.  -0.00141;
-0.23292  0.  0.08512  -0.04213  0.14149  0.  0.  0.  0.  0.  0.  0.  0.03313  0.  0.15223  0.01572  -0.34762  0.  0.  0.  0.  0.  0.  0.  0.70552  0.  -0.24697  0.21888  -0.07805  0.  0.  0.  0.  0.  0.  0.  -0.56316  0.  -0.08268  -0.16054  -0.68637  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.  0.  -0.00348;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -0.99853  0.  0.  0.  0.  0.  -0.00147  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  -1.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  1.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.;
0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.  0.]::Array{Float64,2}

iqNewMatlab=7

nnumericMatlab=0

(hNewJulia,qNewJulia,iqNew,nnumeric)=numericShift(hhIn,qq,0,qRows,qCols,neq)
isapprox(hNewJulia,hNewMatlab,rtol=0.1e-16::Float64,atol=0.0::Float64)&&
sameSpan(qNewJulia,qNewMatlab)&&
iqNew==iqNewMatlab&&
nnumeric==nnumericNewMatlab
end;

end
