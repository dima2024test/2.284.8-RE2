public with sharing class DemoScenariosStatefulBatch implements Database.Batchable<String>, Database.Stateful {

	private String transactionId;

	public DemoScenariosStatefulBatch(String transactionId) {
		this.transactionId = transactionId;
	}

	public Iterable<String> start(Database.BatchableContext bc) {
		return Test.isRunningTest() ? new List<String>{'first execute'} : new List<String>{'first execute', 'second execute'};
	}

	public void execute(Database.BatchableContext bc, List<String> scope) {
		Triton.resumeTransaction(transactionId);
		Triton.setTemplate(Triton.makeBuilder()
				.category(TritonTypes.Category.Apex)
				.type(DemoScenariosController.APEX_BATCH_JOB_SCENARIO_ID)
				.area(TritonTypes.Area.Community));
		try {
			Triton_Error_Data__c tritonErrorData = new Triton_Error_Data__c();
			tritonErrorData.Description__c = DemoScenariosController.TRITON_DEMO_SCENARIO_STATEFUL_BATCH;
			insert tritonErrorData;
		} catch (Exception e) {
			Triton.logNow(
					Triton.fromTemplate()
							.exception(e)
			);
		}
	}

	public void finish(Database.BatchableContext bc) {
	}

}