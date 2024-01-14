# Дарья Святкина, 12-я когорта - Финальный проект. Инженер по тестированию плюс
import sender_stand_request
import data


def get_new_order_track():
    # вызов метод для создания заказа
    response = sender_stand_request.post_new_order(data.order_body)
    # возвращается track нового заказа
    return response.json()["track"]


def test_create_order_and_get_by_track():
    # получение track нового заказа
    new_order_track = get_new_order_track()
    # запрос на получение информации о заказе по track
    get_order_response = sender_stand_request.get_order_by_track(new_order_track)
    # проверка, что статус-код запроса на получение информации о заказе равен 200
    assert get_order_response.status_code == 200

