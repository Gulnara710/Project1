function openAddModal() {
    document.getElementById("modalTitle").textContent = "Добавить курс";
    document.getElementById("formAction").value = "add";
    document.getElementById("courseForm").reset();
    document.getElementById("courseId").value = "";
    document.getElementById("courseModal").style.display = "flex";
}

function openEditModal(id, title, description, details, image, price) {
    document.getElementById("modalTitle").textContent = "Редактировать курс";
    document.getElementById("formAction").value = "update";
    document.getElementById("courseId").value = id;
    document.getElementById("title").value = title;
    document.getElementById("description").value = description;
    document.getElementById("details").value = details || "";
    document.getElementById("image").value = image;
    document.getElementById("price").value = price;
    document.getElementById("courseModal").style.display = "flex";
}

function closeModal() {
    document.getElementById("courseModal").style.display = "none";
}

window.onclick = function(event) {
    const modal = document.getElementById("courseModal");
    if (event.target === modal) {
        modal.style.display = "none";
    }
}