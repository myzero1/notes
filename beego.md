### swagger 默认值

##### 请求参数默认值
```

......
// Post ...
// @Title Post
// @Description create Migrations
// body 的类型的默认值，通过model的example来设置
// @Param	body		body 	models.Migrations	true		"body for Migrations content"
// @Success 201 {int} models.Migrations
// @Failure 403 body is empty
// @router / [post]
func (c *MigrationsController) Post() {
	var v models.Migrations
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &v); err == nil {
		if _, err := models.AddMigrations(&v); err == nil {
			c.Ctx.Output.SetStatus(201)
			c.Data["json"] = v
		} else {
			c.Data["json"] = err.Error()
		}
	} else {
		c.Data["json"] = err.Error()
	}
	c.ServeJSON()
}

// GetOne ...
// @Title Get One
// @Description get Migrations by id
// 除bod类型，其他的类型的默认值，需要再第四个参数位置设置如下面的1
// @Param	id		path 	strings	1	true		"The key for staticblock"
// @Success 200 {object} models.Migrations
// @Failure 403 :id is empty
// @router /:id [get]
func (c *MigrationsController) GetOne() {
	idStr := c.Ctx.Input.Param(":id")
	id, _ := strconv.Atoi(idStr)
	v, err := models.GetMigrationsById(id)
	if err != nil {
		c.Data["json"] = err.Error()
	} else {
		c.Data["json"] = v
	}
	c.ServeJSON()
}
......

```
