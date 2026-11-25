public with sharing class ErrorDataTriggerHandler {

	public static void beforeInsert(List<Triton_Error_Data__c> newList) {
		for (Triton_Error_Data__c tritonErrorData : newList) {
			if (String.isBlank(tritonErrorData.Description__c)) {
				continue;
			}
			if (tritonErrorData.Description__c.equals(DemoScenariosController.TRITON_DEMO_SCENARIO_TRIGGER)
					|| tritonErrorData.Description__c.equals(DemoScenariosController.TRITON_DEMO_SCENARIO_STATEFUL_BATCH)
					|| tritonErrorData.Description__c.equals(DemoScenariosBatch.TRITON_DEMO_SCENARIO_BATCH)
					|| tritonErrorData.Description__c.equals(DemoScenariosQueueable.TRITON_DEMO_SCENARIO_QUEUEABLE)) {
				tritonErrorData.addError(tritonErrorData.Description__c);
			}
			if (tritonErrorData.Description__c.equals(DemoScenariosController.TRITON_DEMO_SCENARIO_TRIGGER_FLOW)) {
				Triton.logNow(
						Triton.fromTemplate()
								.summary(DemoScenariosController.TRITON_DEMO_SCENARIO_TRIGGER_FLOW + ' - Trigger')
								.debug()
				);
				Map<String, Object> params = new Map<String, Object>();
				params.put('recordId', 'apex-trigger-autolaunched-flow');
				Flow.Interview.Flow_3_Error flowInterview = new Flow.Interview.Flow_3_Error(params);
				try {
					flowInterview.start();
				} catch (Exception e) {
					Triton.logNow(
							Triton.fromTemplate()
									.exception(e)
					);
				}
			}
			if (tritonErrorData.Description__c.equals(DemoScenariosController.TRITON_DEMO_SCENARIO_COMPLEX)) {
				Triton.logNow(
						Triton.fromTemplate()
								.summary(DemoScenariosController.TRITON_DEMO_SCENARIO_COMPLEX + ' - Trigger')
								.debug()
				);

				Flow.Interview.Flow_4_Error flowInterview = new Flow.Interview.Flow_4_Error(new Map<String, Object>());
				flowInterview.start();
			}
		}
	}

	public static void afterInsert(List<Triton_Error_Data__c> newList) {

	}

}