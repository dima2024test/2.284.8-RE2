public with sharing class DemoScenariosBatch implements Database.Batchable<String> {

	public static String TRITON_DEMO_SCENARIO_BATCH = 'Triton Demo Scenario (Batch)';

	public DemoScenariosBatch() {
	}

	public Iterable<String> start(Database.BatchableContext bc) {
		return Test.isRunningTest() ? new List<String>{'first execute'} : new List<String>{'first execute', 'second execute'};
	}

	public void execute(Database.BatchableContext bc, List<String> scope) {
		Triton.withCache();
		Triton.setTemplate(Triton.makeBuilder()
				.category(TritonTypes.Category.Apex)
				.type(DemoScenariosController.APEX_BATCH_JOB_WITH_CACHE_SCENARIO_ID)
				.area(TritonTypes.Area.Community));
		try {
			Triton_Error_Data__c tritonErrorData = new Triton_Error_Data__c();
			tritonErrorData.Description__c = TRITON_DEMO_SCENARIO_BATCH;
			insert tritonErrorData;
		} catch (Exception e) {
			Triton.logNow(
					Triton.fromTemplate()
							.exception(e)
			);
		}
	}

	public void finish(Database.BatchableContext bc) {
		Triton.stopTransaction();
	}

}