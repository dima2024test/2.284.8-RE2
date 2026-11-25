public with sharing class DemoScenariosQueueable implements Queueable {

	public static String TRITON_DEMO_SCENARIO_QUEUEABLE = 'Triton Demo Scenario (Queueable)';

	private String transactionId;

	public DemoScenariosQueueable(String transactionId) {
		this.transactionId = transactionId;
	}

	public void execute(QueueableContext context) {
		Triton.resumeTransaction(transactionId);
		Triton.setTemplate(Triton.makeBuilder()
				.category(TritonTypes.Category.Apex)
				.type(DemoScenariosController.QUEUEABLE_ASYNC_APEX_SCENARIO_ID)
				.area(TritonTypes.Area.Community));
		try {
			Triton_Error_Data__c tritonErrorData = new Triton_Error_Data__c();
			tritonErrorData.Description__c = TRITON_DEMO_SCENARIO_QUEUEABLE;
			insert tritonErrorData;
		} catch (Exception e) {
			Triton.log(
					Triton.fromTemplate()
							.exception(e)
			);
		} finally {
			Triton.flush();
		}
	}

}