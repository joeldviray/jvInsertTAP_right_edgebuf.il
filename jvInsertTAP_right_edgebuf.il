procedure( jvInsertTAP_right_edgebuf()

	logics=geGetSelSet()

	foreach(a logics
		logicOrient=a~>orient
		logicOrigin=a~>xy
		logicName=a~>baseName

		lib=ddGetObj(a~>libName) ;get Library of the selected cell
		cells=lib~>cells~>name ;list of all cells in the library
		tap=buildString(rexMatchList("^TAP" cells)) ;get the FILL2B cell in that library

		
		;if( a nil
		;printf("Please select one logic cell first....Press Esc to exit.")
		;  );if
		;else(	

			;jvInsertInstance( buildString(a~>libName) tap "layout");jvInsertInstance

			;jvGetPrBoundary()

			b=a~>master~>shapes

			foreach(i b
				if(i~>layerName=="prBoundary" then prbbox=i~>bBox
				print(prbbox)
				logicL=car(upperRight(prbbox))
				);if
			);foreach
	

			dbCreateParamInstByMasterName(
  				geGetEditCellView()         			;; the current cellview's dbId
  				"tcbn28hpmbwp35"				;a~>libName     					;; the library where the instance comes from
  				"TAPCELLBWP35"					;tap             	    			;; the name of the cell to be instantiated
  				"layout"	            			;; the viewname of the cell to be instantiated
  				strcat(logicName "_tap_R") 			;; symbolToString(gensym("I")) 	;; hopefully a unique instance name
  				car(logicOrigin)+logicL-1.94:car(cdr(logicOrigin))+0.315  	;; origin	car(car(logicOrigin))+1:car(cdr(car(logicOrigin))) 
				logicOrient                   			;; orientation
  				1                           			;; number of instances
  			);dbCreateParamInstByMasterName	
	        ;);if
		



	);foreach
	

);procedure


