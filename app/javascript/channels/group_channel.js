import consumer from "./consumer";

const initGroupCable = () => {
  const messagesContainer = document.getElementById('messages');
  if (messagesContainer) {
    const id = messagesContainer.dataset.groupId;
    consumer.subscriptions.create({ channel: "GroupChannel", id: id },
    {
      received(data) {
        messagesContainer.insertAdjacentHTML('beforeend', data);
      },
    });
  }
}

export { initGroupCable };
