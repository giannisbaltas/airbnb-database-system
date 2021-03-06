alter table Calendar 
alter column price TYPE numeric USING price::numeric,
alter column adjusted_price TYPE numeric USING price::numeric;

-- den xreiasthke na ginei xrhsh ths replace () kathws ta '$' kai to ',' svhsthkan aytomata apo th parapanw entolh.

-- epishs to pedio available ex arxhs to eixame se boolean opote den xreiazetai kapoia allagh.

