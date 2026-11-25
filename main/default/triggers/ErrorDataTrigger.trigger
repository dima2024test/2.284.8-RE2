trigger ErrorDataTrigger on Triton_Error_Data__c (before insert, after insert) {

	if (Trigger.isBefore && Trigger.isInsert) {
		ErrorDataTriggerHandler.beforeInsert(Trigger.new);
	} else if (Trigger.isAfter && Trigger.isInsert) {
		ErrorDataTriggerHandler.afterInsert(Trigger.new);
	}

}